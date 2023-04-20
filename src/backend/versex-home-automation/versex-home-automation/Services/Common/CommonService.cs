using System;
using Microsoft.Extensions.Options;
using versex_home_automation.Models;

namespace versex_home_automation.Services.Common
{
	public class CommonService : ICommonService
	{
		public CommonService(IOptions<AuthConfigurationOptions> authOptions)
		{
			AuthConfigurationOptions = authOptions;
		}

        public IOptions<AuthConfigurationOptions> AuthConfigurationOptions { get; }
    }
}

