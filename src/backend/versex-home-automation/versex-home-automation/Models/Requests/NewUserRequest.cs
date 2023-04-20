using versex_home_automation.Entities;
using System.ComponentModel.DataAnnotations;

namespace versex_home_automation.Models.Requests;

public class NewUserRequest
{
    [Required]
    public string? UserName { get; set; }

    [Required]
    public string? Password { get; set; }
    
    [Required]
    public string? FirstName { get; set; }
    
    [Required]
    public string? LastName { get; set; }

    public ICollection<string>? Roles { get; set; }
}
