namespace test_jurnal.Models.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Студенты
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Студенты()
        {
            Студенты_Предметы = new HashSet<Студенты_Предметы>();
            Студенты_занятия = new HashSet<Студенты_занятия>();
        }

        public int id { get; set; }

        [StringLength(50)]
        public string Фамилия { get; set; }

        [StringLength(50)]
        public string Имя { get; set; }

        [StringLength(50)]
        public string Отчество { get; set; }

        public DateTime? Дата_рождения { get; set; }

        [StringLength(50)]
        public string Подгруппа { get; set; }

        [StringLength(50)]
        public string Группа { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Студенты_Предметы> Студенты_Предметы { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Студенты_занятия> Студенты_занятия { get; set; }
    }
}
