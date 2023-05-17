//-----------------------------------------------------------------------
// <copyright file="AuthenticateResponse.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Models.Responses;

using versex_home_automation.Converters;
using versex_home_automation.Entities;
using System.Text.Json.Serialization;

public class AuthenticateResponse
{
    public AuthenticateResponse(User user, int roleId, string token)
    {
        this.UserId = user.UserId;
        this.UserName = user.UserName;
        this.RoleId = user.RoleId;
        this.Token = token;
    }

    #region Properties

    public int UserId { get; set; }

    public string? UserName { get; set; }

    public int RoleId { get; set; }

    public string Token { get; set; }

    #endregion
}
