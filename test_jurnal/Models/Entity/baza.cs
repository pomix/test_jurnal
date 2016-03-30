namespace test_jurnal.Models.Entity
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class baza : DbContext
    {
        public baza()
            : base("name=DefaultConnection1")
        {
        }

        public virtual DbSet<Занятия> Занятия { get; set; }
        public virtual DbSet<Предметы> Предметы { get; set; }
        public virtual DbSet<Расписание> Расписание { get; set; }
        public virtual DbSet<Студенты> Студенты { get; set; }
        public virtual DbSet<Студенты_занятия> Студенты_занятия { get; set; }
        public virtual DbSet<Студенты_Предметы> Студенты_Предметы { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
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
