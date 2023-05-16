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

    #region Properties

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<Sensor> Sensors {get; set;}

    public virtual DbSet<Actor> Actors { get; set; }

    public virtual DbSet<Device> Devices { get; set; }

    #endregion

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

            entity.Property(e => e.Email)
                .IsRequired()
                .HasMaxLength(255);
        });

        // Testdata:
        // ...

        modelBuilder.Entity<Role>(entity =>
        {
            entity.ToTable("TBL_Role");

            entity.Property(e => e.Name)
                .IsRequired()
                .HasMaxLength(255);
        });

        modelBuilder.Entity<Actor>(entity =>
        {
            entity.ToTable("TBL_Actor");

            entity.Property(e => e.ActorId).HasColumnType("int(11)");

            entity.Property(e => e.UserId)
                .IsRequired()
                .HasColumnType("int(11)");
        });

        modelBuilder.Entity<Device>(entity =>
        {
            entity.ToTable("TBL_Device");

            entity.Property(e => e.DeviceId).HasColumnType("int(11)");

            entity.Property(e => e.Name)
                .IsRequired()
                .HasMaxLength(255);

            entity.Property(e => e.State)
                .IsRequired();

            entity.Property(e => e.Value)
                .IsRequired();
        });

        base.OnModelCreating(modelBuilder);
    }
}

