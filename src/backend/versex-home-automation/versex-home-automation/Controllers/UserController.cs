//-----------------------------------------------------------------------
// <copyright file="UserController.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Controllers;

using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using versex_home_automation.Attributes;
using versex_home_automation.Models.Requests;
using versex_home_automation.Services.User;

[ApiController]
[EnableCors]
[Route("api")]
public class UserController : Controller
{
    #region Privat Fields

    private readonly IUserService _userService;

    private readonly ILogger<UserController> _logger;

    #endregion

    public UserController(IUserService userService, ILogger<UserController> logger)
    {
        _logger = logger;
        _userService = userService;
    }

    #region Public Methods

    [LoggedIn]
    [HttpGet("user/getAll")]
    public IActionResult GetAllUsers()
    {
        _logger.LogInformation("Get all users from the database!");
        return _userService.GetAllUsers();
    }

    [Admin]
    [HttpPut("user/create")]
    public IActionResult CreateNewUser(NewUserRequest req)
    {
        _logger.LogInformation($"Create new user with the username {req.UserName}!");
        return _userService.CreateNewUser(req);
    }

    [Admin]
    [HttpDelete("user/delete/{id}")]
    public IActionResult DeleteUser(string id)
    {
        _logger.LogInformation($"Delete a user with the user id {id}!");
        return _userService.DeleteUser(id);
    }

    [Admin]
    [HttpPut("user/update/{id}")]
    public IActionResult UpdateUser(string id, UpdateUserRequest req)
    {
        _logger.LogInformation($"Update a user with the user id {id}!");
        return _userService.UpdateUser(id, req);
    }

    [Admin]
    [HttpPut("user/update/password/{id}")]
    public IActionResult ChangeUserPassword(string id, UserPasswordChangeRequest req)
    {
        _logger.LogInformation($"Changed the user password from the user id {id}!");
        return _userService.ChangeUserPassword(id, req);
    }

    #endregion
}
