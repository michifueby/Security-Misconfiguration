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
    private readonly IUserService _userService;

    public UserController(IUserService userService)
    {
        _userService = userService;
    }

    [LoggedIn]
    [HttpGet("user/getAll")]
    public IActionResult GetAllUsers()
    {
        return _userService.GetAllUsers();
    }

    //[Admin]
    [HttpPut("user/create")]
    public IActionResult CreateNewUser(NewUserRequest req)
    {
        return _userService.CreateNewUser(req);
    }

    [Admin]
    [HttpDelete("user/delete/{id}")]
    public IActionResult DeleteUser(string id)
    {
        return _userService.DeleteUser(id);
    }

    [Admin]
    [HttpPut("user/update/{id}")]
    public IActionResult UpdateUser(string id, UpdateUserRequest req)
    {
        return _userService.UpdateUser(id, req);
    }

    [Admin]
    [HttpPut("user/update/password/{id}")]
    public IActionResult ChangeUserPassword(string id, UserPasswordChangeRequest req)
    {
        return _userService.ChangeUserPassword(id, req);
    }
}
