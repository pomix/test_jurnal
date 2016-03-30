using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Site.Domain.Procedur
{
    public class Raspisnie
    {
        public int? День_недели { get; set; }

        public int? Номер_пары { get; set; }

        public int? Код_предмета { get; set; }

        public int? UserId { get; set; }

        public string Номер_аудитории { get; set; }

        public string Группа1 { get; set; }

        public string Группа2 { get; set; }

        public string Группа3 { get; set; }

        public int id_расписания { get; set; }

        public string Тип_занятия { get; set; }

        public string Примечание { get; set; }

        public bool? Верхняя_неделя { get; set; }

        public bool? Нижняя_неделя { get; set; }

        public bool? Типовая_неделя { get; set; }

        public bool? Нетиповая_неделя { get; set; }

        public string Время { get; set; }

        public string Подгруппа { get; set; }

        public string Название { get; set; }
    }
}