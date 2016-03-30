using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using System.Data.SqlClient;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using DotNetOpenAuth.AspNet;
using Microsoft.Web.WebPages.OAuth;
using WebMatrix.WebData;
using test_jurnal.Filters;
using test_jurnal.Models.Entity;
using System.Configuration;
using System.IO;
using System.Data;


namespace test_jurnal.Controllers
{
    [InitializeSimpleMembership]
    public class HomeController : Controller
    {
        baza em = new baza();
        public ActionResult Index()
        {


            return View();
        }
        [Authorize]
        [HttpPost]
        public ActionResult Index(Raspisnie table)
        {
          
            if (table.id_расписания != 0)
            {
                if(em.Предметы.FirstOrDefault(a => a.Название == table.Название)!=null)
                table.Код_предмета = em.Предметы.FirstOrDefault(a => a.Название == table.Название).Код_предмета;
                else
                {
                    Предметы pred=new Предметы();
                    pred.UserId=WebSecurity.CurrentUserId;
                    pred.Название=table.Название;
                    em.Предметы.Add(pred);
                    em.SaveChanges();
                    table.Код_предмета = em.Предметы.FirstOrDefault(a => a.Название == table.Название).Код_предмета;
                }
                try
                {
                    Предметы qw = new Предметы();
                    Расписание ras = new Расписание();
                    ras = em.Расписание.Where(c => c.id_расписания == table.id_расписания).FirstOrDefault();
                    qw = em.Предметы.Where(c => c.Код_предмета == table.Код_предмета).FirstOrDefault();
                    qw.Название = table.Название;
                    ras.UserId = WebSecurity.CurrentUserId;
                    ras.Верхняя_неделя = table.Верхняя_неделя;
                    ras.Номер_аудитории = table.Номер_аудитории;
                    ras.Группа1 = table.Группа1;
                    ras.Группа2 = table.Группа2;
                    ras.Группа3 = table.Группа3;
                    ras.Подгруппа = table.Подгруппа;
                    ras.Нижняя_неделя = table.Нижняя_неделя;
                    ras.Тип_занятия = table.Тип_занятия;
                    ras.Код_предмета = table.Код_предмета;
                    em.SaveChanges();
                }
                catch
                {
                    ViewBag.er = "Невозможно добавить запись (Проверти вторичный и первичный ключ)";
                }
            }
            else
            {
                table.UserId = WebSecurity.CurrentUserId;
                if (em.Предметы.FirstOrDefault(a => a.Название == table.Название)!=null)
                    table.Код_предмета = em.Предметы.FirstOrDefault(a => a.Название == table.Название).Код_предмета;
                else
                {
                    Предметы pred=new Предметы();
                    pred.UserId=WebSecurity.CurrentUserId;
                    pred.Название=table.Название;
                    em.Предметы.Add(pred);
                    em.SaveChanges();

                    table.Код_предмета = em.Предметы.FirstOrDefault(a => a.Название == table.Название).Код_предмета;
                }
                Расписание ras = new Расписание();
                ras.UserId = WebSecurity.CurrentUserId;
                ras.Верхняя_неделя = table.Верхняя_неделя;
                ras.Номер_аудитории = table.Номер_аудитории;
                ras.Код_предмета = table.Код_предмета;
                ras.День_недели = table.День_недели;
                ras.Номер_пары = table.Номер_пары;
                ras.Группа1 = table.Группа1;
                ras.Группа2 = table.Группа2;
                ras.Группа3 = table.Группа3;
                ras.Нижняя_неделя = table.Нижняя_неделя;
                ras.Верхняя_неделя = table.Верхняя_неделя;
                ras.Подгруппа = table.Подгруппа;
                ras.Тип_занятия = table.Тип_занятия;
                em.Расписание.Add(ras);
                try
                {
                    em.SaveChanges();
                }
                catch
                {
                    ViewBag.er = "Невозможно добавить запись (Проверти вторичный и первичный ключ)";
                }
            }
            ViewBag.Vse = em.Расписание.Count();
            return View();
        }
        [Authorize]
        public ActionResult Ix(int id)
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        [Authorize]
        public ActionResult PartialRaspisanie()
        {
            System.Data.SqlClient.SqlParameter param = new System.Data.SqlClient.SqlParameter("@param", WebSecurity.CurrentUserId);
            return PartialView(em.Database.SqlQuery<Raspisnie>("Расписание_препода @param", param).ToList<Raspisnie>());
        }

        [HttpPost]
        public PartialViewResult PostGrup(string str)
        {
            if (str != null)
            {
                SqlParameter param = new SqlParameter("@group", str);
                return PartialView(em.Database.SqlQuery<test_jurnal.Models.Entity.proceduri.AllGrup>("СтудПоГруппе @group", param).ToList<test_jurnal.Models.Entity.proceduri.AllGrup>());

            }
            else
                return PartialView();
           
        }
        //public ActionResult AutocompleteSearchGrup(string term)
        //{
        //    var models = from i in em.Grup().ToList().Where(a => a.Contains(term))
        //                 select new
        //                 {
        //                     value = i
        //                 };
        //    return Json(models.ToList(), JsonRequestBehavior.AllowGet);
        //}
        public ActionResult AutocompleteSearchPredmet(string term)
        {
            var models = from i in em.Предметы.ToList().Where(a => a.UserId == WebSecurity.CurrentUserId).Where(a => a.Название.Contains(term))
                         select new
                         {
                             value = i.Название
                         };
            return Json(models, JsonRequestBehavior.AllowGet);
        }

        [Authorize]
        public JsonResult GetRaspisanie()
        {
            System.Data.SqlClient.SqlParameter param = new System.Data.SqlClient.SqlParameter("@param", WebSecurity.CurrentUserId);
            return Json(em.Database.SqlQuery<Raspisnie>("Расписание_препода @param", param).ToList<Raspisnie>(), JsonRequestBehavior.AllowGet);
        }
        //[HttpPost]
        //public ActionResult File(HttpPostedFileBase Files, string str, int dekanat)
        //{
            //List<Студенты> exlStds = new List<Студенты>();
            //string path = "";
            //if (Files != null)
            //{
            //    path = AppDomain.CurrentDomain.GetData("DataDirectory").ToString()+"\\Files\\"+Files.FileName;
            //    Files.SaveAs(path);
            //     }

            //str = str.ToUpper();
            //string s;
            //Microsoft.Office.Interop.Excel.Application excel = new Microsoft.Office.Interop.Excel.Application();
            //Microsoft.Office.Interop.Excel.Workbook wb = excel.Workbooks.Open(path);
            //Microsoft.Office.Interop.Excel.Worksheet ws;
            //ws = wb.Sheets[1];
            //excel.DisplayAlerts = false;
            //int i = 1;
            //int a;

            //if (dekanat == 1)//ЭТФ
            //{
            //    while (ws.Cells[i, 2].Text != str)
            //    {
            //        i++;
            //        if (i >= 1500) break;

            //    }
            //    while (ws.Cells[i, 2].Text != "")
            //    {
            //        s = ws.Cells[i, 2].Text;
            //        string[] fio = s.Split(new char[] { ' ' });
            //        if (Int32.TryParse(ws.Cells[i, 7].Text, out a) == true)
            //            exlStds.Add(new Студенты { Фамилия = fio[0], Имя = fio[1], Отчество = fio[2],Группа=str });
            //            i++;

            //    }
            //}
            //else if (dekanat == 2)//Заочн
            //{
            //    while (ws.Cells[i, 1].Text != str)
            //    {
            //        i++;
            //        if (i >= 1500) break;

            //    }
            //    while (ws.Cells[i, 1].Text == str)
            //    {
            //        s = ws.Cells[i, 2].Text;
            //        string[] fio = s.Split(new char[] { ' ' });
            //        if (Int32.TryParse(ws.Cells[i, 3].Text, out a) == true)
            //            exlStds.Add(new Студенты { Фамилия = fio[0], Имя = fio[1], Отчество = fio[2], Группа = str });
            //            //запрос на добавление
            //            // richTextBox1.AppendText(fio[0] + " " + fio[1] + " " + fio[2] + " " + ws.Cells[i, 3].Text + "\n");//фамилия, имя, отчество, №зач
            //            i++;

            //    }
            //}
            //else if (dekanat == 3)//Росс
            //{
            //    while (ws.Cells[i, 2].Text.IndexOf(str) == -1)
            //    {
            //        i++;
            //        if (i >= 1500) break;

            //    }
            //    while (ws.Cells[i, 1].Text != "")
            //    {
            //        s = ws.Cells[i, 2].Text;
            //        string[] fio = s.Split(new char[] { ' ' });
            //        if (Int32.TryParse(ws.Cells[i, 3].Text, out a) == true)
            //            exlStds.Add(new Студенты { Фамилия = fio[0], Имя = fio[1], Отчество = fio[2], Группа = str });
            //            //запрос на добавление
            //            //  richTextBox1.AppendText(fio[0] + " " + fio[1] + " " + fio[2] + " " + ws.Cells[i, 3].Text + "\n");//фамилия, имя, отчество, №зач
            //            i++;

            //    }
            //}
            ////if (i >= 1500) { richTextBox1.AppendText("Группа не найдена."); }
            //excel.Quit();
            //for (int j = 0; j < exlStds.Count; j++)
            //    em.Студенты.Add(exlStds[j]);
            //em.SaveChanges();
            //    if (System.IO.File.Exists(path))
            //    {
            //        //System.IO.File.Delete(path);
        //    //    }
        //    //return Json(exlStds);

        //}
    }
}
