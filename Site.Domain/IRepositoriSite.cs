using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Site.Domain.Procedur;

namespace Site.Domain
{
   public  interface IRepositoriSite
    {
        IEnumerable<AllGrup> GetAllGrup(string grup);
        IEnumerable<Raspisnie> GetRaspisanie(int userId);
       //void AddRaspisnie ()
    }
}
