//-----------------------------------------------------------------------
// <copyright file="SensorController.cs" company="FH Wiener Neustadt">
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
using versex_home_automation.Services.Actor;
using versex_home_automation.Services.Sensor;

[ApiController]
[EnableCors]
[Route("api")]
public class SensorController : Controller
{
    #region Privat Fields

    private readonly ISensorService _sensorService;

    private readonly ILogger<SensorController> _logger;

    #endregion

    public SensorController(ISensorService sensorService, ILogger<SensorController> logger)
    {
        _logger = logger;
        _sensorService = sensorService;
    }

    #region Public Methods

    [LoggedIn]
    [HttpGet("sensor/getAll")]
    public IActionResult GetAllSensors()
    {
        _logger.LogInformation("Get all sensors from the database!");
        return _sensorService.GetAllSensors();
    }

    [LoggedIn]
    [HttpGet("sensor/getCurrentValue/{id}")]
    public IActionResult GetCurrentValueFromSensor(string id)
    {
        _logger.LogInformation("Get current value from a specific sensor from the database!");
        return _sensorService.GetCurrentValueFromSensor(id);
    }

    #endregion
}

