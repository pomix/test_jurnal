using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using Site.Domain;
using Site.Data;
using Site.Data.Model;

namespace Site.Data
{
    class Repositori : IRepositoriSite 
    {
        IEnumerable<Site.Domain.Procedur.AllGrup> GetAllGrup(string grup)
        {
            BazaSite baza=new BazaSite();
           System.Data.SqlClient.SqlParameter param = new System.Data.SqlClient.SqlParameter("@group", grup);
           return baza.Database.SqlQuery<Site.Domain.Procedur.AllGrup>("СтудПоГруппе @group", param);
            
        }

        IEnumerable<Site.Domain.Procedur.Raspisnie> GetRaspisanie(int userId)
        {
            BazaSite baza = new BazaSite();
            System.Data.SqlClient.SqlParameter param = new System.Data.SqlClient.SqlParameter("@param", userId);
            return baza.Database.SqlQuery<Site.Domain.Procedur.Raspisnie>("Расписание_препода @param", param);

        }
    }
}
