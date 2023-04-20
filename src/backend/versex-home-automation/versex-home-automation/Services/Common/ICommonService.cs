using System;
using Microsoft.Extensions.Options;
using versex_home_automation.Models;

namespace versex_home_automation.Services.Common
{
	public interface ICommonService
	{
        IOptions<AuthConfigurationOptions> AuthConfigurationOptions { get; }
    }
}

