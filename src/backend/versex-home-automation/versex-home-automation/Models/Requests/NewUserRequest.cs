//-----------------------------------------------------------------------
// <copyright file="NewUserRequest.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Models.Requests;

using versex_home_automation.Entities;
using System.ComponentModel.DataAnnotations;

public class NewUserRequest
{
    [Required]
    public string? UserName { get; set; }

    [Required]
    public string? Password { get; set; }
    
    [Required]
    public string? FirstName { get; set; }
    
    [Required]
    public string? LastName { get; set; }

    public ICollection<string>? Roles { get; set; }
}
