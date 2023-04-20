using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using versex_home_automation.Models.Requests;
using versex_home_automation.Services.Authentication;

namespace versex_home_automation.Controllers;

[ApiController]
[EnableCors]
[Route("api")]
public class AuthController : Controller
{
    private readonly IAuthenticationService _authService;

    public AuthController(IAuthenticationService authService)
    {
        _authService = authService;
    }

    [HttpPost("authenticate")]
    public IActionResult Authenticate(AuthenticateRequest req)
    {
        var response = _authService.Authenticate(req);

        if (response == null)
        {
            return BadRequest(new
            {
                message = "Invalid Username or password!"
            });
        }

        return Ok(response);
    }
}
