//-----------------------------------------------------------------------
// <copyright file="Sensors.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Entities;

using System;
using System.ComponentModel.DataAnnotations;

public class Sensor
{
    #region Properties

    [Required]
    [Key]
    public int SensorId { get; set; }

    [Required]
    public string? Name { get; set; }

    [Required]
    public string? MAC { get; set; }

    [Required]
    public int Value { get; set; }

    #endregion
}

