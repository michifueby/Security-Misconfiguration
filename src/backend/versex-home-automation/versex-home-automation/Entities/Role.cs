using System;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;
using versex_home_automation.Entities.Enums;

namespace versex_home_automation.Entities;

public class Role
{
    [Required]
    [Key]
    public int RoleId { get; set; }

    [Required]
    public RoleName Name { get; set; }

    [JsonIgnore]
    public virtual ICollection<User>? UsersWithRole { get; set; }
}

