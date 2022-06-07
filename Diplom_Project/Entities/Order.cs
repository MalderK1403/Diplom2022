using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Diplom_Project.Entities
{
    public class Order
    {
        public int id_order { get; set; }
        public int id_driver { get; set; }
        public int exauto { get; set; }
        public int id_cargo { get; set; }
        public string start_location { get; set; }
        public string ends_location { get; set; }
        public int distance { get; set; }
        public DateTime order_date { get; set; }
        public DateTime finish_date { get; set; }
        public int loaders { get; set; }
        public int price { get; set; }
        public int cost     { get; set; }
        public int weight { get; set; }
        public int dimensions { get; set; }
        public int id_client { get; set; }
        public int id_manager { get; set; }
    }
}
