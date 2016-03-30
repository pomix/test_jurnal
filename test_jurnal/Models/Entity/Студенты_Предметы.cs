namespace test_jurnal.Models.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Студенты_Предметы
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Номер_зачетки { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(50)]
        public string Код_предмета { get; set; }

        public double? Рейтинг { get; set; }

        public virtual Предметы Предметы { get; set; }

        public virtual Студенты Студенты { get; set; }
    }
}
