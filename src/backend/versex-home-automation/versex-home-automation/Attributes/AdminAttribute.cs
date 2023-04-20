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

        if (account == null || account.Roles.All(r => r.Name != Entities.Enums.RoleName.Admin))
        {
            // not logged in or not admin
            context.Result = new JsonResult(new { message = "Unauthorized - admin only!" }) { StatusCode = StatusCodes.Status401Unauthorized };
        }
    }
}