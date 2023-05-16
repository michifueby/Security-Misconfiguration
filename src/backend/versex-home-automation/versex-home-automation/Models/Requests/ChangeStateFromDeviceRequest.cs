//-----------------------------------------------------------------------
// <copyright file="ChangeStateFromDeviceRequest.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Models.Requests;

using System;
using System.ComponentModel.DataAnnotations;

public class ChangeStateFromDeviceRequest
{
    [Required]
    public bool State { get; set; }

    [Required]
    public int Value { get; set; }
}

