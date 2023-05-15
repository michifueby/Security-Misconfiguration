//-----------------------------------------------------------------------
// <copyright file="AdminAttribute.cs" company="FH Wiener Neustadt">
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
public class AdminAttribute : Attribute, IAuthorizationFilter
{
    public void OnAuthorization(AuthorizationFilterContext context)
    {
        var account = (User)context.HttpContext.Items["User"]!;

        if (account == null || account.RoleId != 1)
        {
            // not logged in or not admin
            context.Result = new JsonResult(new { message = "Unauthorized - Admin only!" }) { StatusCode = StatusCodes.Status401Unauthorized };
        }
    }
}