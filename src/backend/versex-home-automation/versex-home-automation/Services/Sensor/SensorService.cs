//-----------------------------------------------------------------------
// <copyright file="SensorService.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Services.Sensor;

using System;
using Microsoft.AspNetCore.Mvc;
using versex_home_automation.Data;
using versex_home_automation.Models.Responses;
using versex_home_automation.Services.Common;

public class SensorService : ISensorService
{
    #region Privat Fields

    private readonly DatabaseContext _dataContext;

    private readonly ILogger<SensorService> _logger;

    #endregion

    public SensorService(DatabaseContext dataContext, ILogger<SensorService> logger)
	{
        _logger = logger;
        _dataContext = dataContext;
	}

    #region Public Methods

    public IActionResult GetAllSensors()
    {
        var allSensors = _dataContext.Sensors.AsEnumerable();

        var response = new SensorQueryResponse
        {
            Sensors = allSensors.Select(s => new SensorResponse(s))
        };

        if (response.Sensors.Count() == 0)
        {
            return new NoContentResult();
        }

        return new JsonResult(response) { StatusCode = StatusCodes.Status200OK };
    }

    public IActionResult GetCurrentValueFromSensor(string id)
    {
        var parsedSensor = GetSensorByStringId(id, out bool errorHappened, out JsonResult error);

        if (errorHappened)
            return error;

        // Get sensor from db
        var sensor = _dataContext.Sensors.FirstOrDefault(x => x.SensorId == parsedSensor.SensorId);

        var returnMessage = new SensorResponse(sensor!);

        return new JsonResult(returnMessage) { StatusCode = StatusCodes.Status200OK };
    }

    #endregion

    private Entities.Sensor GetSensorByStringId(string id, out bool errorHappened, out JsonResult error)
    {
        // Parse Id to Integer
        var wasParseSuccessfull = int.TryParse(id, out int parsedId);

        if (!wasParseSuccessfull)
        {
            errorHappened = true;
            error = new JsonResult(new { message = "Invalid SensorId provided! Can not be parsed into INTEGER!" })
            { StatusCode = StatusCodes.Status400BadRequest };

            return null!;
        }

        // Get sensor from db
        var sensor = _dataContext.Sensors.FirstOrDefault(x => x.SensorId == parsedId);

        if (sensor == null)
        {
            errorHappened = true;
            error = new JsonResult(new { message = "No such sensor in database!" }) { StatusCode = StatusCodes.Status400BadRequest };

            return null!;
        }

        errorHappened = false;
        error = null!;

        return sensor;
    }
}

