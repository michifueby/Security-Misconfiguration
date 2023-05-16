//-----------------------------------------------------------------------
// <copyright file="Actor.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

using System;
using System.ComponentModel.DataAnnotations;

namespace versex_home_automation.Entities;

public class Actor
{
    #region Properties

    [Key]
    [Required]
    public int ActorId { get; set; }

    [Required]
    public int UserId { get; set; }

    [Required]
    public int Value { get; set; }

    [Required]
    public string? Name { get; set; }

    #endregion
}

