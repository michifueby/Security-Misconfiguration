//-----------------------------------------------------------------------
// <copyright file="LogResponse.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Models.Responses;

using System;
using versex_home_automation.Entities;

public class LogResponse
{
	public LogResponse(Log log)
	{
		this.LogId = log.LogId;
		this.TimeStamp = log.TimeStamp;
		this.Message = log.Message;
	}

    #region Properties

	public int LogId { get; set; }

    public DateTimeOffset TimeStamp { get; set; }

    public string? Message { get; set; }

    #endregion
}

