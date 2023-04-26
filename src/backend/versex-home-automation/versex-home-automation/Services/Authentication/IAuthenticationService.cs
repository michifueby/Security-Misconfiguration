//-----------------------------------------------------------------------
// <copyright file="IAuthenticationService.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Services.Authentication;

using versex_home_automation.Models.Requests;
using versex_home_automation.Models.Responses;

public interface IAuthenticationService
{
    AuthenticateResponse? Authenticate(AuthenticateRequest req);
}
