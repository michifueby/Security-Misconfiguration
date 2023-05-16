//-----------------------------------------------------------------------
// <copyright file="Device.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Entities;

using System;
using System.ComponentModel.DataAnnotations;

public class Device
{
    #region Properties

    [Required]
    [Key]
    public int DeviceId { get; set; }

    [Required]
    public string? Name { get; set; }

    [Required]
    public bool State { get; set; }

    [Required]
    public int Value { get; set; }

    #endregion
}