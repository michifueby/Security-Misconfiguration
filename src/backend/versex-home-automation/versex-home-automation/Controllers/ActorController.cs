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
using versex_home_automation.Models.Requests;
using versex_home_automation.Services.Actor;
using versex_home_automation.Services.Sensor;

[ApiController]
[EnableCors]
[Route("api")]
public class ActorController : Controller
{
    #region Privat Fields

    private readonly IActorService _actorService;

    private readonly ILogger<ActorController> _logger;

    #endregion

    public ActorController(IActorService actorService, ILogger<ActorController> logger)
	{
        _logger = logger;
        _actorService = actorService;
	}

    #region Public Methods

    [LoggedIn]
    [HttpGet("actor/getAll")]
    public IActionResult GetAllActors()
    {
        _logger.LogInformation("Get all actors from the database!");
        return _actorService.GetAllActors();
    }

    [LoggedIn]
    [HttpPut("actor/changeState/{id}")]
    public IActionResult ChangeStateFromActor(string id, ChangeStateFromActorRequest req)
    {
        _logger.LogInformation($"Change the state of the actor with id {id}!");
        return _actorService.ChangeStateFromActor(id, req);
    }

    #endregion
}

