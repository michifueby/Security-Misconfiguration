//-----------------------------------------------------------------------
// <copyright file="Log.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

using System;
using System.ComponentModel.DataAnnotations;

namespace versex_home_automation.Entities;

public class Log
{
    #region Properties

    [Key]
    [Required]
    public int LogId { get; set; }

    [Required]
    public DateTimeOffset TimeStamp { get; set; }

    [Required]
    public string? Message { get; set; }

    #endregion
}