//-----------------------------------------------------------------------
// <copyright file="UserPasswordChangeRequest.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Models.Requests;

using System.ComponentModel.DataAnnotations;

public class UserPasswordChangeRequest
{
    [Required]
    public string? Password { get; set; }
}
