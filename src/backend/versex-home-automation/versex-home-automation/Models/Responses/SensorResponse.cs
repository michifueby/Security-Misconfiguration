//-----------------------------------------------------------------------
// <copyright file="SensorResponse.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

using versex_home_automation.Entities;

using System;

namespace versex_home_automation.Models.Responses;

public class SensorResponse
{
    public SensorResponse(Sensor sensor)
    {
        this.SensorId = sensor.SensorId;
        this.Name = sensor.Name;
        this.MAC = sensor.MAC;
        this.Value = sensor.Value;
    }

    #region Properties

    public int SensorId { get; set; }

    public string? Name { get; set; }

    public string? MAC { get; set; }

    public int Value { get; set; }

    #endregion
}

