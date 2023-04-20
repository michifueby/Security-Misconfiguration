using versex_home_automation.Entities;

namespace versex_home_automation.Models.Responses;

#nullable disable

public class UserQueryResponse
{
    public IEnumerable<UserResponse> Users { get; set; }
}
