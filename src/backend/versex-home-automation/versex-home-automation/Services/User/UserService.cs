//-----------------------------------------------------------------------
// <copyright file="UserService.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Services.User;

using Microsoft.AspNetCore.Mvc;
using versex_home_automation.Data;
using versex_home_automation.Entities;
using versex_home_automation.Entities.Enums;
using versex_home_automation.Helper;
using versex_home_automation.Models;
using versex_home_automation.Models.Requests;
using versex_home_automation.Models.Responses;
using versex_home_automation.Services.Common;
using versex_home_automation.Services.User;

public class UserService : IUserService
{
    private readonly DatabaseContext _dataContext;

    private readonly string? _pepper;

    private readonly int _iteration = 3;

    private readonly ICommonService _commonService;

    public UserService(DatabaseContext dataContext, ICommonService commonService)
    {
        _dataContext = dataContext;

        _commonService = commonService;
        _pepper = _commonService.AuthConfigurationOptions.Value.AuthConfigurationCode;
    }

    public IActionResult GetAllUsers()
    {
        var allUsers = _dataContext.Users.AsEnumerable();

        var response = new UserQueryResponse
        {
            Users = allUsers.Select(u => new UserResponse(u))
        };

        if (response.Users.Count() == 0)
        {
            return new NoContentResult();
        }

        return new JsonResult(response) { StatusCode = StatusCodes.Status200OK };
    }

    public Entities.User? GetById(int id)
    {
        // Get user from db
        var user = _dataContext.Users.FirstOrDefault(x => x.UserId == id);

        return user;
    }

    public IActionResult CreateNewUser(NewUserRequest req)
    {
        var roles = GetRequestedRoles(req.Roles!, out bool errorHappened, out JsonResult error);

        int roleId;

        if (errorHappened)
            return error;

        if (roles.First().Equals(RoleName.Admin))
            roleId = 0;
        else
            roleId = 1;

        var user = new Entities.User
        {
            UserName = req.UserName,
            FirstName = req.FirstName,
            LastName = req.LastName,
            PasswordSalt = PasswordHasher.GenerateSalt(),
            RoleId = roleId,
        };

        // Hashes the password
        user.Password = PasswordHasher.ComputeHash(req.Password!, user.PasswordSalt, _pepper!, _iteration);

        var returnMessage = _dataContext.Users.Add(user).Entity;

        try
        {
            _dataContext.SaveChanges();
        }
        catch (Microsoft.EntityFrameworkCore.DbUpdateException e)
        {
            return new JsonResult(new { message = e.InnerException!.Message }) { StatusCode = StatusCodes.Status400BadRequest };
        };

        return new JsonResult(returnMessage) { StatusCode = StatusCodes.Status201Created };
    }

    public IActionResult DeleteUser(string id)
    {
        var user = GetUserByStringId(id, out bool errorHappened, out JsonResult error);

        if (errorHappened)
            return error;

        _dataContext.Users.Remove(user);
        _dataContext.SaveChanges();

        return new NoContentResult();
    }

    public IActionResult UpdateUser(string id, UpdateUserRequest req)
    {
        var user = GetUserByStringId(id, out bool errorHappened, out JsonResult error);

        if (errorHappened)
            return error;

        var roles = GetRequestedRoles(req.Roles!, out bool rolesErrorHappened, out JsonResult rolesError);

        if (rolesErrorHappened)
            return rolesError;

        // Update data
        user.UserName = req.UserName;
        user.FirstName = req.FirstName;
        user.LastName = req.LastName;

        // Add requested, missing roles
        foreach (var role in roles.Where(requestedRole => !user.Roles!.Contains(requestedRole)))
        {
            user.Roles!.Add(role);
        }

        // Remove assigned roles which are not in the request
        foreach (var role in user.Roles!.Where(r => !roles.Contains(r)))
        {
            user.Roles!.Remove(role);
        }

        var returnValue = _dataContext.Users.Update(user).Entity;
        var returnMessage = new UserResponse(returnValue);

        try
        {
            _dataContext.SaveChanges();
        }
        catch (Microsoft.EntityFrameworkCore.DbUpdateException e)
        {
            return new JsonResult(new { message = e.InnerException!.Message }) { StatusCode = StatusCodes.Status400BadRequest };
        }

        return new JsonResult(returnMessage) { StatusCode = StatusCodes.Status200OK };
    }

    public IActionResult ChangeUserPassword(string id, UserPasswordChangeRequest req)
    {
        var user = GetUserByStringId(id, out bool errorHappened, out JsonResult error);

        if (errorHappened)
            return error;

        user.Password = req.Password;

        _dataContext.Users.Update(user);
        _dataContext.SaveChanges();
        return new NoContentResult();
    }

    private Entities.User GetUserByStringId(string id, out bool errorHappened, out JsonResult error)
    {
        // Parse Id to Integer
        var wasParseSuccessfull = int.TryParse(id, out int parsedId);

        if (!wasParseSuccessfull)
        {
            errorHappened = true;
            error = new JsonResult(new { message = "Invalid UserId provided. Can not be parsed into INTEGER!" })
            { StatusCode = StatusCodes.Status400BadRequest };
            return null!;
        }

        // Get user from db
        var user = _dataContext.Users.FirstOrDefault(x => x.UserId == parsedId);

        if (user == null)
        {
            errorHappened = true;
            error = new JsonResult(new { message = "No such user in database!" }) { StatusCode = StatusCodes.Status400BadRequest };
            return null!;
        }

        errorHappened = false;
        error = null!;
        return user;
    }

    private List<Role> GetRequestedRoles(ICollection<string> requestedRoles, out bool errorHappened, out JsonResult error)
    {
        var roles = new List<Role>();

        // If specific roles are requested, check for invalid roles and assign roles
        if (requestedRoles != null)
        {
            var allRoles = _dataContext.Roles.AsEnumerable();

            if (requestedRoles.Any(r => allRoles.All(dbr => dbr.Name.ToString() != r)))
            {
                errorHappened = true;
                error = new JsonResult(new { message = "Invalid role requested!" }) { StatusCode = StatusCodes.Status400BadRequest };
                return null!;
            }

            roles.AddRange(allRoles.Where(r => requestedRoles.Contains(r.Name.ToString())));
        }

        errorHappened = false;
        error = null!;

        return roles;
    }
}
