using Microsoft.AspNetCore.Mvc;
using versex_home_automation.Models.Requests;

namespace versex_home_automation.Services.User;

public interface IUserService
{
    IActionResult GetAllUsers();

    Entities.User? GetById(int id);

    IActionResult CreateNewUser(NewUserRequest req);

    IActionResult DeleteUser(string id);

    IActionResult UpdateUser(string id, UpdateUserRequest req);
    
    IActionResult ChangeUserPassword(string id, UserPasswordChangeRequest req);
}
