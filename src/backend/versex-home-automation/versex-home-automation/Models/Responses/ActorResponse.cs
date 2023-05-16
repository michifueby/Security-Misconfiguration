//-----------------------------------------------------------------------
// <copyright file="ActorResponse.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

using System;
using versex_home_automation.Entities;

namespace versex_home_automation.Models.Responses;

public class ActorResponse
{
	public ActorResponse(Actor actor)
	{
        this.ActorId = actor.ActorId;
        this.UserId = actor.UserId;
        this.Name = actor.Name;
        this.Value = actor.Value;
	}

    #region Properties

    public int ActorId { get; set; }

    public int UserId { get; set; }

    public string? Name { get; set; }

    public int Value { get; set; }

    #endregion
}

