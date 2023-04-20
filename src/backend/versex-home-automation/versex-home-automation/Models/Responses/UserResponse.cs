using versex_home_automation.Converters;
using versex_home_automation.Entities;
using System.Text.Json.Serialization;

namespace versex_home_automation.Models.Responses;

#nullable disable

public class UserResponse
{
    public UserResponse(User user)
    {
        UserId = user.UserId;
        UserName = user.UserName;
        FirstName = user.FirstName;
        LastName = user.LastName;
        Roles = user.Roles;
    }

    public int UserId { get; set; }

    public string UserName { get; set; }

    public string FirstName { get; set; }

    public string LastName { get; set; }

    [JsonConverter(typeof(ItemConverterDecorator<RoleJsonConverter>))]
    public ICollection<Role> Roles { get; set; }
}
