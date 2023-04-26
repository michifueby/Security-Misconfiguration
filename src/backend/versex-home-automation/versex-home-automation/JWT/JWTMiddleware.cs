//-----------------------------------------------------------------------
// <copyright file="JWTMiddleware.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using versex_home_automation.Services.User;
using System.IdentityModel.Tokens.Jwt;
using System.Text;

namespace versex_home_automation.JWT;

public class JWTMiddleware
{
    private readonly RequestDelegate _next;

    private readonly JWTSettings _JWTSettings;

    public JWTMiddleware(RequestDelegate next, IOptions<JWTSettings> appSettings)
    {
        _next = next;
        _JWTSettings = appSettings.Value;
    }

    public async Task Invoke(HttpContext context, IUserService userService)
    {
        var token = context.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();

        if (token != null)
            attachAccountToContext(context, userService, token);

        await _next(context);
    }

    private void attachAccountToContext(HttpContext context, IUserService userService, string token)
    {
        try
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_JWTSettings.Secret!);
            tokenHandler.ValidateToken(token, new TokenValidationParameters
            {
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = new SymmetricSecurityKey(key),
                ValidateIssuer = false,
                ValidateAudience = false,
                // set clockskew to zero so tokens expire exactly at token expiration time (instead of 5 minutes later)
                ClockSkew = TimeSpan.Zero
            }, out SecurityToken validatedToken);

            var jwtToken = (JwtSecurityToken)validatedToken;
            var userId = int.Parse(jwtToken.Claims.First(x => x.Type == "userId").Value);

            // attach account to context on successful jwt validation
            context.Items["User"] = userService.GetById(userId);
        }
        catch
        {
            // do nothing if jwt validation fails
            // account is not attached to context so request won't have access to secure routes
        }
    }
}
