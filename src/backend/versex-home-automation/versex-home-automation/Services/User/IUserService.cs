//-----------------------------------------------------------------------
// <copyright file="IUserService.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Services.User;

using Microsoft.AspNetCore.Mvc;
using versex_home_automation.Models.Requests;

public interface IUserService
{
    IActionResult GetAllUsers();

    Entities.User? GetById(int id);

    IActionResult CreateNewUser(NewUserRequest req);

    IActionResult DeleteUser(string id);

    IActionResult UpdateUser(string id, UpdateUserRequest req);
    
    IActionResult ChangeUserPassword(string id, UserPasswordChangeRequest req);
}
