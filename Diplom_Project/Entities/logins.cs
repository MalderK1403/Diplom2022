using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Diplom_Project.Entities
{
    public class logins
    {
       public int id_login { get; set; } 
        public string Login_name { get; set; }
         public int id_people { get; set; } 
        public int id_user_group { get; set; }  
        public string password { get; set; }

        public logins(int id_login, string login_name, int id_people, int id_user_group, string password)
        {
            this.id_login = id_login;
            Login_name = login_name;
            this.id_people = id_people;
            this.id_user_group = id_user_group;
            this.password = password;
        }
    }
}
