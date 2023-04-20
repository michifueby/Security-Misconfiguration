using versex_home_automation.Converters;
using versex_home_automation.Entities;
using System.Text.Json.Serialization;

namespace versex_home_automation.Models.Responses;

public class AuthenticateResponse
{
    public AuthenticateResponse(User user, IEnumerable<Role>? roles, string token)
    {
        UserId = user.UserId;
        UserName = user.UserName;
        Roles = roles;
        Token = token;
    }

    public int UserId { get; set; }

    public string? UserName { get; set; }

    [JsonConverter(typeof(ItemConverterDecorator<RoleJsonConverter>))]
    public IEnumerable<Role>? Roles { get; set; }

    public string Token { get; set; }
}
