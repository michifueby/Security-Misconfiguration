//-----------------------------------------------------------------------
// <copyright file="UserResponse.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Models.Responses;

using versex_home_automation.Converters;
using versex_home_automation.Entities;
using System.Text.Json.Serialization;

public class UserResponse
{
    public UserResponse(User user)
    {
        UserId = user.UserId;
        UserName = user.UserName;
        Email = user.Email;
        FirstName = user.FirstName;
        LastName = user.LastName;
        RoleId = user.RoleId;
    }

    #region Properties

    public int UserId { get; set; }

    public string? UserName { get; set; }

    public string? Email { get; set; }

    public string? FirstName { get; set; }

    public string? LastName { get; set; }

    public int RoleId { get; set; }

    #endregion
}
