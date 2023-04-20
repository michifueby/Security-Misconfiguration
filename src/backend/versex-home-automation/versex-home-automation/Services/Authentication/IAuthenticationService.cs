using versex_home_automation.Models.Requests;
using versex_home_automation.Models.Responses;

namespace versex_home_automation.Services.Authentication;

public interface IAuthenticationService
{
    AuthenticateResponse? Authenticate(AuthenticateRequest req);
}
