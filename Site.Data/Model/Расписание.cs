namespace Site.Data.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Расписание
    {
        public int? День_недели { get; set; }

        public int? Номер_пары { get; set; }

        public int? Код_предмета { get; set; }

        public int? UserId { get; set; }

        [StringLength(50)]
        public string Номер_аудитории { get; set; }

        [StringLength(50)]
        public string Группа1 { get; set; }

        [StringLength(50)]
        public string Группа2 { get; set; }

        [StringLength(50)]
        public string Группа3 { get; set; }

        [Key]
        public int id_расписания { get; set; }

        [StringLength(50)]
        public string Тип_занятия { get; set; }

        [StringLength(150)]
        public string Примечание { get; set; }

        public bool? Верхняя_неделя { get; set; }

        public bool? Нижняя_неделя { get; set; }

        public bool? Типовая_неделя { get; set; }

        public bool? Нетиповая_неделя { get; set; }

        [StringLength(20)]
        public string Время { get; set; }

        [StringLength(50)]
        public string Подгруппа { get; set; }

        public virtual UserProfile UserProfile { get; set; }

        public virtual Предметы Предметы { get; set; }
    }
}
