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
    public AuthenticateResponse(User user, IEnumerable<Role>? roles, string token)
    {
        this.UserId = user.UserId;
        this.UserName = user.UserName;
        this.Roles = roles;
        this.Token = token;
    }

    #region Properties

    public int UserId { get; set; }

    public string? UserName { get; set; }

    [JsonConverter(typeof(ItemConverterDecorator<RoleJsonConverter>))]
    public IEnumerable<Role>? Roles { get; set; }

    public string Token { get; set; }

    #endregion
}
