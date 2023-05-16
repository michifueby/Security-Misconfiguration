//-----------------------------------------------------------------------
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
        var allActors = _dataContext.Actors.AsEnumerable();

        var response = new ActorQueryResponse
        {
            Actors = allActors.Select(a => new ActorResponse(a))
        };

        if (response.Actors.Count() == 0)
        {
            return new NoContentResult();
        }

        return new JsonResult(response) { StatusCode = StatusCodes.Status200OK };
    }

    public IActionResult ChangeStateFromActor(string id, ChangeStateFromActorRequest req)
    {
        var actor = GetActorByStringId(id, out bool errorHappened, out JsonResult error);

        if (errorHappened)
            return error;

        // Update actor
        actor.Value = req.Value;

        var returnValue = _dataContext.Actors.Update(actor).Entity;
        var returnMessage = new ActorResponse(returnValue);

        try
        {
            _dataContext.SaveChanges();
        }
        catch (Microsoft.EntityFrameworkCore.DbUpdateException e)
        {
            return new JsonResult(new { message = e.InnerException!.Message }) { StatusCode = StatusCodes.Status400BadRequest };
        }

        return new JsonResult(returnMessage) { StatusCode = StatusCodes.Status200OK };
    }

    #endregion

    private Entities.Actor GetActorByStringId(string id, out bool errorHappened, out JsonResult error)
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
        var actor = _dataContext.Actors.FirstOrDefault(x => x.ActorId == parsedId);

        if (actor == null)
        {
            errorHappened = true;
            error = new JsonResult(new { message = "No such actor in database!" }) { StatusCode = StatusCodes.Status400BadRequest };
            return null!;
        }

        errorHappened = false;
        error = null!;

        return actor;
    }
}

