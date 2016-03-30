namespace Site.Data.Model
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class BazaSite : DbContext
    {
        public BazaSite()
            : base("name=BazaSite")
        {
        }

        public virtual DbSet<UserProfile> UserProfiles { get; set; }
        public virtual DbSet<Занятия> Занятия { get; set; }
        public virtual DbSet<Предметы> Предметы { get; set; }
        public virtual DbSet<Расписание> Расписание { get; set; }
        public virtual DbSet<Студенты> Студенты { get; set; }
        public virtual DbSet<Студенты_занятия> Студенты_занятия { get; set; }
        public virtual DbSet<Студенты_Предметы> Студенты_Предметы { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<UserProfile>()
                .HasMany(e => e.Занятия)
                .WithRequired(e => e.UserProfile)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Занятия>()
                .HasMany(e => e.Студенты_занятия)
                .WithRequired(e => e.Занятия)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Предметы>()
                .HasMany(e => e.Занятия)
                .WithRequired(e => e.Предметы)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Предметы>()
                .HasMany(e => e.Студенты_Предметы)
                .WithRequired(e => e.Предметы)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Студенты>()
                .HasMany(e => e.Студенты_Предметы)
                .WithRequired(e => e.Студенты)
                .HasForeignKey(e => e.Номер_зачетки)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Студенты>()
                .HasMany(e => e.Студенты_занятия)
                .WithRequired(e => e.Студенты)
                .HasForeignKey(e => e.Номер_зачетки)
                .WillCascadeOnDelete(false);
        }
    }
}
