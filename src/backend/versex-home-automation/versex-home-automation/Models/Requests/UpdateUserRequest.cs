//-----------------------------------------------------------------------
// <copyright file="UpdateUserRequest.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Models.Requests;

using System.ComponentModel.DataAnnotations;

public class UpdateUserRequest
{
    #region Properties

    [Required]
    public string? UserName { get; set; }

    [Required]
    public string? Email { get; set; }

    [Required]
    public string? FirstName { get; set; }

    [Required]
    public string? LastName { get; set; }

    public ICollection<string>? Roles { get; set; }

    #endregion
}
