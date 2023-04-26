//-----------------------------------------------------------------------
// <copyright file="User.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Entities;

using System;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Text.Json.Serialization;
using versex_home_automation.Converters;

public class User
{
        [Required]
        [Key]
        public int UserId { get; set; }

        [Required]
        public string? FirstName { get; set; }

        [Required]
        public string? LastName { get; set; }

        [Required]
        public string? UserName { get; set; }

        [Required]
        public string? Password { get; set; }

        public string? PasswordSalt { get; set; }

        [Required]
        public int RoleId { get; set; } 

        [JsonIgnore]
        [JsonConverter(typeof(RoleJsonConverter))]
        public virtual ICollection<Role>? Roles { get; set; }
}


