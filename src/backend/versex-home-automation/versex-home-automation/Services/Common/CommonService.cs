//-----------------------------------------------------------------------
// <copyright file="CommonService.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Services.Common;

using System;
using Microsoft.Extensions.Options;
using versex_home_automation.Models;

public class CommonService : ICommonService
{
	public CommonService(IOptions<AuthConfigurationOptions> authOptions)
	{
		AuthConfigurationOptions = authOptions;
	}

    public IOptions<AuthConfigurationOptions> AuthConfigurationOptions { get; }
}


