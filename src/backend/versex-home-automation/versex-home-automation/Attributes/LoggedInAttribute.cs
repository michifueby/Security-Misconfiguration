//-----------------------------------------------------------------------
// <copyright file="LoggedInAttribute.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Attributes;

using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using versex_home_automation.Entities;
using System;

[AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
public class LoggedInAttribute : Attribute, IAuthorizationFilter
{
    public void OnAuthorization(AuthorizationFilterContext context)
    {
        var account = (User)context.HttpContext.Items["User"]!;

        if (account == null)
        {
            // not logged in
            context.Result = new JsonResult(new { message = "Unauthorized - not logged in!" }) { StatusCode = StatusCodes.Status401Unauthorized };
        }
    }
}