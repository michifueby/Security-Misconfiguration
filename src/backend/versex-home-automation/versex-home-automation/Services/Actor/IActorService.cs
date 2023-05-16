//-----------------------------------------------------------------------
// <copyright file="IActorService.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Services.Actor;

using System;
using Microsoft.AspNetCore.Mvc;
using versex_home_automation.Models.Requests;

public interface IActorService
{
    IActionResult GetAllActors();

    IActionResult ChangeStateFromActor(string id, ChangeStateFromDeviceRequest req);
}

