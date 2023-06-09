﻿//-----------------------------------------------------------------------
// <copyright file="ActorService.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Services.Actor;

using System;
using Microsoft.AspNetCore.Mvc;
using Org.BouncyCastle.Ocsp;
using versex_home_automation.Data;
using versex_home_automation.Entities;
using versex_home_automation.Models.Requests;
using versex_home_automation.Models.Responses;
using versex_home_automation.Services.Sensor;

public class ActorService : IActorService
{
    #region Privat Fields

    private readonly DatabaseContext _dataContext;

    private readonly ILogger<ActorService> _logger;

    #endregion

    public ActorService(DatabaseContext dataContext, ILogger<ActorService> logger)
    {
        _logger = logger;
        _dataContext = dataContext;
    }

    #region Public Methods

    public IActionResult GetAllActors()
    {
        var allActors = _dataContext.Devices.AsEnumerable();

        var response = new DeviceQueryResponse
        {
            Devices = allActors.Select(a => new DeviceResponse(a))
        };

        if (response.Devices.Count() == 0)
        {
            return new NoContentResult();
        }

        var log = new Log
        {
            TimeStamp = DateTimeOffset.Now.DateTime,
            Message = $"Get all actors from the database!"
        };

        _dataContext.Logs.Add(log);
        _dataContext.SaveChanges();

        return new JsonResult(response) { StatusCode = StatusCodes.Status200OK };
    }

    public IActionResult CreateNewActor(NewDeviceRequest req)
    {
        var actor = new Entities.Actor 
        {
            UserId = 1
        };

        var actorReturnMessage = _dataContext.Actors.Add(actor).Entity;

        var device = new Entities.Device
        {
            DeviceId = actorReturnMessage.ActorId,
            Name = req.Name,
            MAC = req.MAC,
            State = req.State,
            Value = req.Value
        };

        var returnMessage = _dataContext.Devices.Add(device).Entity;

        try
        {
            _dataContext.SaveChanges();
        }
        catch (Microsoft.EntityFrameworkCore.DbUpdateException e)
        {
            return new JsonResult(new { message = e.InnerException!.Message }) { StatusCode = StatusCodes.Status400BadRequest };
        };

        var log = new Log
        {
            TimeStamp = DateTimeOffset.Now,
            Message = $"Create a new device {device.Name} and saves the actor in the database!"
        };

        _dataContext.Logs.Add(log);
        _dataContext.SaveChanges();

        return new JsonResult(returnMessage) { StatusCode = StatusCodes.Status201Created };
    }

    public IActionResult ChangeStateFromActor(string id, ChangeStateFromDeviceRequest req)
    {
        var actor = GetActorByStringId(id, out bool errorHappened, out JsonResult error);

        if (errorHappened)
            return error;

        // Update actor
        actor.Value = req.Value;
        actor.State = req.State;

        var returnValue = _dataContext.Devices.Update(actor).Entity;
        var returnMessage = new DeviceResponse(returnValue);

        try
        {
            _dataContext.SaveChanges();
        }
        catch (Microsoft.EntityFrameworkCore.DbUpdateException e)
        {
            return new JsonResult(new { message = e.InnerException!.Message }) { StatusCode = StatusCodes.Status400BadRequest };
        }

        var log = new Log
        {
            TimeStamp = DateTimeOffset.Now,
            Message = $"Update actor {actor.Name} with the state {actor.State} and value {actor.Value}!"
        };

        _dataContext.Logs.Add(log);
        _dataContext.SaveChanges();

        return new JsonResult(returnMessage) { StatusCode = StatusCodes.Status200OK };
    }

    #endregion

    private Entities.Device GetActorByStringId(string id, out bool errorHappened, out JsonResult error)
    {
        // Parse Id to Integer
        var wasParseSuccessfull = int.TryParse(id, out int parsedId);

        if (!wasParseSuccessfull)
        {
            errorHappened = true;
            error = new JsonResult(new { message = "Invalid ActorId provided. Can not be parsed into INTEGER!" })
            { StatusCode = StatusCodes.Status400BadRequest };

            return null!;
        }

        // Get actor from db
        var actor = _dataContext.Devices.FirstOrDefault(x => x.DeviceId == parsedId);

        if (actor == null)
        {
            errorHappened = true;
            error = new JsonResult(new { message = "No such actor in database!" }) { StatusCode = StatusCodes.Status400BadRequest };

            var log = new Log
            {
                TimeStamp = DateTimeOffset.Now,
                Message = $"No such actor in database!"
            };

            _dataContext.Logs.Add(log);
            _dataContext.SaveChanges();

            return null!;
        }

        errorHappened = false;
        error = null!;

        return actor;
    }
}

