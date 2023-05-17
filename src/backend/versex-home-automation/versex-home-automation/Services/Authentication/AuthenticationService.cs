//-----------------------------------------------------------------------
// <copyright file="AuthenticationServices.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Services.Authentication;

using Microsoft.Extensions.Options;
using versex_home_automation.Entities;
using Microsoft.IdentityModel.Tokens;
using versex_home_automation.Data;
using versex_home_automation.JWT;
using versex_home_automation.Models.Requests;
using versex_home_automation.Models.Responses;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using versex_home_automation.Helper;
using versex_home_automation.Services.Common;
using versex_home_automation.Entities.Enums;

public class AuthenticationService : IAuthenticationService
{
    #region Privat Fields

    private readonly DatabaseContext _dataContext;

    private readonly JWTSettings _JWTSettings;

    private readonly string _pepper;

    private readonly int _iteration = 3;

    private readonly ICommonService _commonService;

    #endregion

    public AuthenticationService(DatabaseContext dataContext, IOptions<JWTSettings> jwtSettings, ICommonService commonService)
    {
        _dataContext = dataContext;
        _JWTSettings = jwtSettings.Value;

        _commonService = commonService;
        _pepper = _commonService.AuthConfigurationOptions.Value.AuthConfigurationCode!;
    }

    #region Public Methods

    public AuthenticateResponse? Authenticate(AuthenticateRequest req)
    {
        var user = _dataContext.Users.SingleOrDefault(u => u.UserName == req.UserName);

        if (user.RoleId.Equals(1))
        {
            var role = new Role();
            role.RoleId = user.RoleId;
        }
        else if (user.RoleId.Equals(0))
        {
            var role = new Role();
            role.RoleId = user.RoleId;
        }

        // Check if user exists
        if (user == null)
        {
            var userLog = new Log
            {
                TimeStamp = DateTimeOffset.Now,
                Message = $"The user {user!.FirstName} {user.LastName} doesn't exists in the database!"
            };

            _dataContext.Logs.Add(userLog);
            _dataContext.SaveChanges();

            return null;
        }

        // Check password
        var passwordHash = PasswordHasher.ComputeHash(req.Password!, user.PasswordSalt!, _pepper, _iteration);
        if (user.Password != passwordHash)
        {
            var passwordLog = new Log
            {
                TimeStamp = DateTimeOffset.Now,
                Message = $"The user {user.FirstName} {user.LastName} has entered an invalid password!"
            };

            _dataContext.Logs.Add(passwordLog);
            _dataContext.SaveChanges();

            return null;
        }

        var secondLog = new Log
        {
            TimeStamp = DateTimeOffset.Now,
            Message = $"The user {user.FirstName} {user.LastName} has successfully logged in with the password!"
        };

        _dataContext.Logs.Add(secondLog);
        _dataContext.SaveChanges();

        // JWT token generation
        var token = GenerateToken(user.UserId);

        return new AuthenticateResponse(user, user.RoleId, token);
    }

    public string GenerateToken(int userId)
    {
        var mySecurityKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(_JWTSettings.Secret!));
        var tokenHandler = new JwtSecurityTokenHandler();
        var tokenDescriptor = new SecurityTokenDescriptor
        {
            Subject = new ClaimsIdentity(new Claim[]
            {
            new Claim("userId", userId.ToString()),
            }),
            Expires = DateTime.UtcNow + _JWTSettings.ValidityDuration,
            SigningCredentials = new SigningCredentials(mySecurityKey, SecurityAlgorithms.HmacSha256Signature)
        };

        var token = tokenHandler.CreateToken(tokenDescriptor);

        var log = new Log
        {
            TimeStamp = DateTimeOffset.Now,
            Message = $"Generate successfully the JWT token for userid {userId}!"
        };

        _dataContext.Logs.Add(log);
        _dataContext.SaveChanges();


        return tokenHandler.WriteToken(token);
    }

    #endregion
}
