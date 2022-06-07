using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Diplom_Project.Entities
{
    internal class PreOrder
    {
        public int id_PreOrder { get; set; }
        public string Start_location { get; set; }
        public string End_location { get; set; }
        public DateTime Order_date { get; set; }
        public DateTime End_date { get; set; }
        public int weight { get; set; }
        public int dimensions { get; set; }
        public int id_login     { get; set; }
    }
}
