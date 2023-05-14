//-----------------------------------------------------------------------
// <copyright file="Program.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

using System;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using MySql.EntityFrameworkCore.Extensions;
using Serilog;
using versex_home_automation.Data;
using versex_home_automation.JWT;
using versex_home_automation.Models;
using versex_home_automation.Services.Authentication;
using versex_home_automation.Services.Common;
using versex_home_automation.Services.User;

var builder = WebApplication.CreateBuilder(args);

// Configure the serilog logger
var logger = new LoggerConfiguration()
  .ReadFrom.Configuration(builder.Configuration)
  .Enrich.FromLogContext()
  .CreateLogger();

builder.Logging.ClearProviders();
builder.Logging.AddSerilog(logger);

// Add services to the container
builder.Services.AddControllers();

// Configure the DB connection
builder.Services.AddEntityFrameworkMySQL()
                .AddDbContext<DatabaseContext>(options =>
                {
                    options.UseMySQL(builder.Configuration.GetConnectionString("DBConnection")!);
                });

// Allow all CORS 
builder.Services.AddCors(c =>
{
    c.AddPolicy("AllowAnyOrigin", builder =>
    {
        builder.AllowAnyOrigin()
            .AllowAnyMethod()
            .AllowAnyHeader();
    });
});

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo
    {
        Title = "Versex-Home-Automation-API",
        Version = "v1"
    });
    c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme()
    {
        Name = "Authorization",
        Type = SecuritySchemeType.ApiKey,
        Scheme = "Bearer",
        BearerFormat = "JWT",
        In = ParameterLocation.Header,
        Description = "JWT Authorization header using the Bearer scheme. \r\n\r\n Enter 'Bearer' [space] and then your token in the text input below.\r\n\r\nExample: \"Bearer ",
    });
    c.AddSecurityRequirement(new OpenApiSecurityRequirement {
        {
            new OpenApiSecurityScheme {
                Reference = new OpenApiReference {
                    Type = ReferenceType.SecurityScheme,
                        Id = "Bearer"
                }
            },
            new string[] {}
        }
    });
});

// Get auth code
string authConfigurationCode = builder.Configuration.GetValue<string>("AuthConfig")!;

builder.Services.Configure<AuthConfigurationOptions>(options =>
{
    options.AuthConfigurationCode = authConfigurationCode;
});

builder.Services.AddSingleton<ICommonService, CommonService>();
builder.Services.AddTransient<IUserService, UserService>();
builder.Services.AddTransient<IAuthenticationService, AuthenticationService>();

// Configure JWT
builder.Services.Configure<JWTSettings>(settings =>
{
    var secret = builder.Configuration.GetValue<string>("JWTSettings:JWT_SECRET");
    if (secret == null)
    {
        throw new ArgumentNullException("The JWT secret must be set.");
    }

    var duration = builder.Configuration.GetValue<TimeSpan>("JWTSettings:JWT_VALIDITY_DURATION");
    if (duration == default)
    {
        throw new ArgumentNullException("The JWT validity duration must be set.");
    }

    settings.Secret = secret;
    settings.ValidityDuration = duration;
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

//JWT Middleware added
app.UseMiddleware<JWTMiddleware>();

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.UseCors("AllowAnyOrigin");

app.Run();


