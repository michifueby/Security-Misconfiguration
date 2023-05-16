//-----------------------------------------------------------------------
// <copyright file="ISensorService.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Services.Sensor;

using System;
using Microsoft.AspNetCore.Mvc;

public interface ISensorService
{
    IActionResult GetAllSensors();

    IActionResult GetCurrentValueFromSensor(string id);
}

