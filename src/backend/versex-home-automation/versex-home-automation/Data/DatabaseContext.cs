using Microsoft.EntityFrameworkCore;
using versex_home_automation.Entities;

namespace versex_home_automation.Data;

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
                .HasMaxLength(250);

            entity.Property(e => e.LastName)
                .IsRequired()
                .HasMaxLength(250);

            entity.Property(e => e.Password)
                .IsRequired()
                .HasMaxLength(250);

            entity.Property(e => e.UserName)
                .IsRequired()
                .HasMaxLength(250);
        });

        // Testdata:
        var SUPERUSER = new User
        {
            UserId = 1,
            UserName = "user",
            FirstName = "Super",
            LastName = "User",
            Password = "test123"
        };

        modelBuilder.Entity<Role>(entity =>
        {
            entity.ToTable("TBL_Role");

            modelBuilder.Entity<Role>()
            .Property(r => r.Name)
            .HasConversion<string>();
        });

        modelBuilder.Entity<User>().HasData(SUPERUSER);

        base.OnModelCreating(modelBuilder);
    }
}

