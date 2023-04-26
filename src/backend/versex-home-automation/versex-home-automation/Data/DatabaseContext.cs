//-----------------------------------------------------------------------
// <copyright file="DatabaseContext.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.Data;

using Microsoft.EntityFrameworkCore;
using versex_home_automation.Entities;

public partial class DatabaseContext : DbContext
{
    public DatabaseContext()
    {
    }

    public DatabaseContext(DbContextOptions<DatabaseContext> options) : base(options)
    {
    }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<User>(entity =>
        {
            entity.ToTable("TBL_User");

            entity.Property(e => e.UserId).HasColumnType("int(11)");

            entity.Property(e => e.FirstName)
                .IsRequired()
                .HasMaxLength(255);

            entity.Property(e => e.LastName)
                .IsRequired()
                .HasMaxLength(255);

            entity.Property(e => e.Password)
                .IsRequired()
                .HasMaxLength(255);

            entity.Property(e => e.UserName)
                .IsRequired()
                .HasMaxLength(255);
        });

        // Testdata:
        // ...

        modelBuilder.Entity<Role>(entity =>
        {
            entity.ToTable("TBL_Role");

            modelBuilder.Entity<Role>()
            .Property(r => r.Name)
            .HasConversion<string>();
        });

        base.OnModelCreating(modelBuilder);
    }
}

