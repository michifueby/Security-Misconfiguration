using System.ComponentModel.DataAnnotations;

namespace versex_home_automation.Models.Requests;

public class AuthenticateRequest
{
    [Required]
    public string UserName { get; set; }

    [Required]
    public string Password { get; set; }
}
