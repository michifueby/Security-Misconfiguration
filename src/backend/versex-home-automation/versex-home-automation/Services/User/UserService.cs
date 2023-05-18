//-----------------------------------------------------------------------
// <copyright file="UserService.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Services.User;

using System.Data;
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
    #region Privat Fields

    private readonly DatabaseContext _dataContext;

    private readonly string? _pepper;

    private readonly int _iteration = 3;

    private readonly ICommonService _commonService;

    private readonly ILogger<UserService> _logger;

    #endregion

    public UserService(DatabaseContext dataContext, ICommonService commonService, ILogger<UserService> logger)
    {
        _dataContext = dataContext;

        _commonService = commonService;
        _pepper = _commonService.AuthConfigurationOptions.Value.AuthConfigurationCode;
    }

    #region Public Methods

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


        var log = new Log
        {
            TimeStamp = DateTimeOffset.Now,
            Message = "Get all users from the database!"
        };

        try
        {
            _dataContext.Logs.Add(log);
            _dataContext.SaveChanges();
        }
        catch (Microsoft.EntityFrameworkCore.DbUpdateException e)
        {
            return new JsonResult(new { message = e.InnerException!.Message }) { StatusCode = StatusCodes.Status400BadRequest };
        };

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
        var roles = req.Roles;

        int roleId;

        if (roles!.First().Equals(RoleName.Admin.ToString()))
            roleId = 1;
        else
            roleId = 0;

        var user = new Entities.User
        {
            UserName = req.UserName,
            Email = req.Email,
            FirstName = req.FirstName,
            LastName = req.LastName,
            PasswordSalt = PasswordHasher.GenerateSalt(),
            RoleId = roleId
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

        var log = new Log
        {
            TimeStamp = DateTimeOffset.Now,
            Message = $"Create a new user {user.FirstName} {user.LastName} and saves the user in the database!"
        };

        _dataContext.Logs.Add(log);
        _dataContext.SaveChanges();

        return new JsonResult(returnMessage) { StatusCode = StatusCodes.Status201Created };
    }

    public IActionResult DeleteUser(string id)
    {
        var user = GetUserByStringId(id, out bool errorHappened, out JsonResult error);

        if (errorHappened)
            return error;

        var log = new Log
        {
            TimeStamp = DateTimeOffset.Now,
            Message = $"Delete user {user.FirstName} {user.LastName} from the database!"
        };

        _dataContext.Logs.Add(log);
        _dataContext.SaveChanges();
       
        try
        {
            _dataContext.Users.Remove(user);
            _dataContext.SaveChanges();
        }
        catch (Microsoft.EntityFrameworkCore.DbUpdateException e)
        {
            return new JsonResult(new { message = e.InnerException!.Message }) { StatusCode = StatusCodes.Status400BadRequest };
        };

        return new NoContentResult();
    }

    public IActionResult UpdateUser(string id, UpdateUserRequest req)
    {
        var user = GetUserByStringId(id, out bool errorHappened, out JsonResult error);

        if (errorHappened)
            return error;

        var roles = req.Roles;

        int roleId;

        if (roles!.First().Equals(RoleName.Admin.ToString()))
            roleId = 1;
        else
            roleId = 0;

        // Update data
        user.UserName = req.UserName;
        user.Email = req.Email;
        user.FirstName = req.FirstName;
        user.LastName = req.LastName;
        user.RoleId = roleId;

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

        var log = new Log
        {
            TimeStamp = DateTimeOffset.Now,
            Message = $"Update user {user.FirstName} {user.LastName} and saves the updated user in the database!"
        };

        _dataContext.Logs.Add(log);
        _dataContext.SaveChanges();

        return new JsonResult(returnMessage) { StatusCode = StatusCodes.Status200OK };
    }

    public IActionResult ChangeUserPassword(string id, UserPasswordChangeRequest req)
    {
        var user = GetUserByStringId(id, out bool errorHappened, out JsonResult error);

        if (errorHappened)
            return error;

        user.Password = req.Password;

        try
        {
            _dataContext.Users.Update(user);
            _dataContext.SaveChanges();
        }
        catch (Microsoft.EntityFrameworkCore.DbUpdateException e)
        {
            return new JsonResult(new { message = e.InnerException!.Message }) { StatusCode = StatusCodes.Status400BadRequest };
        }

        var log = new Log
        {
            TimeStamp = DateTimeOffset.Now,
            Message = $"Change password from user {user.FirstName} {user.LastName} and saves the updated password in the database!"
        };

        _dataContext.Logs.Add(log);
        _dataContext.SaveChanges();

        return new NoContentResult();
    }

    #endregion

    #region Privat Methods

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

            var log = new Log
            {
                TimeStamp = DateTimeOffset.Now,
                Message = $"No such user in database!"
            };

            _dataContext.Logs.Add(log);
            _dataContext.SaveChanges();

            return null!;
        }

        errorHappened = false;
        error = null!;

        return user;
    }

    #endregion
}
