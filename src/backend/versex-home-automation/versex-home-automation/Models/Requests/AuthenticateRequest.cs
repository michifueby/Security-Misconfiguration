//-----------------------------------------------------------------------
// <copyright file="AuthenticateRequest.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

using System.ComponentModel.DataAnnotations;

namespace versex_home_automation.Models.Requests;

public class AuthenticateRequest
{
    [Required]
    public string? UserName { get; set; }

    [Required]
    public string? Password { get; set; }
}
