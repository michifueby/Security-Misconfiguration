//-----------------------------------------------------------------------
// <copyright file="AuthController.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Controllers;

using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using versex_home_automation.Models.Requests;
using versex_home_automation.Services.Authentication;

[ApiController]
[EnableCors]
[Route("api")]
public class AuthController : Controller
{
    #region Privat Fields

    private readonly IAuthenticationService _authService;

    private readonly ILogger<AuthController> _looger;

    #endregion

    public AuthController(IAuthenticationService authService, ILogger<AuthController> logger)
    {
        _looger = logger;
        _authService = authService;
    }

    [HttpPost("authenticate")]
    public IActionResult Authenticate(AuthenticateRequest req)
    {
        var response = _authService.Authenticate(req);

        if (response == null)
        {
            _looger.LogInformation("Invalid username or password!");

            return BadRequest(new
            {
                message = "Invalid Username or password!"
            });
        }

        return Ok(response);
    }
}
