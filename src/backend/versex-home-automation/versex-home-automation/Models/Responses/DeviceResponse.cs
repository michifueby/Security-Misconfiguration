//-----------------------------------------------------------------------
// <copyright file="DeviceResponse.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

using System;
using versex_home_automation.Entities;

namespace versex_home_automation.Models.Responses;

public class DeviceResponse
{
	public DeviceResponse(Device device)
	{
        this.DeviceId = device.DeviceId;
        this.Name = device.Name;
        this.State = device.State;
        this.Value = device.Value;
	}

    #region Properties

    public int DeviceId { get; set; }

    public string? Name { get; set; }

    public bool State { get; set; }

    public int Value { get; set; }

    #endregion
}

