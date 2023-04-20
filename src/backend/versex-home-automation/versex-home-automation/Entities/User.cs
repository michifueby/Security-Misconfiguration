using System;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Text.Json.Serialization;
using versex_home_automation.Converters;

namespace versex_home_automation.Entities;

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


