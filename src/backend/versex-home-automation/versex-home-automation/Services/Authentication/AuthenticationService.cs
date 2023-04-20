using Microsoft.Extensions.Options;
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

namespace versex_home_automation.Services.Authentication;

public class AuthenticationService : IAuthenticationService
{
    private readonly DatabaseContext _dataContext;

    private readonly JWTSettings _JWTSettings;

    private readonly string _pepper;

    private readonly int _iteration = 3;

    private readonly ICommonService _commonService;

    public AuthenticationService(DatabaseContext dataContext, IOptions<JWTSettings> jwtSettings, ICommonService commonService)
    {
        _dataContext = dataContext;
        _JWTSettings = jwtSettings.Value;

        _commonService = commonService;
        _pepper = _commonService.AuthConfigurationOptions.Value.AuthConfigurationCode!;
    }

    public AuthenticateResponse? Authenticate(AuthenticateRequest req)
    {
        var user = _dataContext.Users.SingleOrDefault(u => u.UserName == req.UserName);

        // Check if user exists
        if (user == null)
        {
            return null;
        }

        // Check password
        var passwordHash = PasswordHasher.ComputeHash(req.Password, user.PasswordSalt!, _pepper, _iteration);
        if (user.Password != passwordHash)
            return null;

        // JWT token generation
        var token = GenerateToken(user.UserId);

        return new AuthenticateResponse(user, user.Roles, token);
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
        return tokenHandler.WriteToken(token);
    }
}
