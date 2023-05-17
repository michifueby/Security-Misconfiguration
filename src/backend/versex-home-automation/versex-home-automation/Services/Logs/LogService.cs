//-----------------------------------------------------------------------
// <copyright file="LogService.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Services.Log;

using System;
using Microsoft.AspNetCore.Mvc;
using versex_home_automation.Data;
using versex_home_automation.Models.Responses;
using versex_home_automation.Services.Actor;

public class LogService : ILogService
{
    #region Privat Fields

    private readonly DatabaseContext _dataContext;

    private readonly ILogger<LogService> _logger;

    #endregion

    public LogService(DatabaseContext dataContext, ILogger<LogService> logger)
    {
        _logger = logger;
        _dataContext = dataContext;
    }

    public IActionResult GetAllLogs()
    {
        // Get all logs
        var allLogs = _dataContext.Logs.AsEnumerable();

        var response = new LogQueryResponse
        {
            Logs = allLogs.Select(a => new LogResponse(a))
        };

        if (response.Logs.Count() == 0)
        {
            return new NoContentResult();
        }

        return new JsonResult(response) { StatusCode = StatusCodes.Status200OK };
    }
}

