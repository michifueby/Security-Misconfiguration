//-----------------------------------------------------------------------
// <copyright file="AuthConfigurationOptions.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Models;

using System;
using Microsoft.Extensions.Options;

public class AuthConfigurationOptions
{
    public string? AuthConfigurationCode { get; set; }
}

