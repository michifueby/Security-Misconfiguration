//-----------------------------------------------------------------------
// <copyright file="LogController.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Controllers;

using System;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using versex_home_automation.Attributes;
using versex_home_automation.Services.Log;

[ApiController]
[EnableCors]
[Route("api")]
public class LogController : Controller
{
    #region Privat Fields

    private readonly ILogService _logService;

    private readonly ILogger<LogController> _logger;

    #endregion

    public LogController(ILogService logService, ILogger<LogController> logger)
    {
        _logger = logger;
        _logService = logService;
    }

    [LoggedIn]
    [HttpGet("log/getAll")]
    public IActionResult GetAllLogs()
    {
        _logger.LogInformation("Get all logs from the database!");
        return _logService.GetAllLogs();
    }
}

