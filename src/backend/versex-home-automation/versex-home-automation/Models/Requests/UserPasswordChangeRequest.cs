using System.ComponentModel.DataAnnotations;

namespace versex_home_automation.Models.Requests;

public class UserPasswordChangeRequest
{
    [Required]
    public string? Password { get; set; }
}
