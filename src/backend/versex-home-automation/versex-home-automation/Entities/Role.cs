//-----------------------------------------------------------------------
// <copyright file="Role.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Entities;

using System;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;
using versex_home_automation.Entities.Enums;

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

