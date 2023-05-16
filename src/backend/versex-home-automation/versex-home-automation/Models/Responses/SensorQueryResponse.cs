//-----------------------------------------------------------------------
// <copyright file="SensorQueryResponse.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Models.Responses;

using versex_home_automation.Entities;

public class SensorQueryResponse
{
    public IEnumerable<SensorResponse>? Sensors { get; set; }
}
