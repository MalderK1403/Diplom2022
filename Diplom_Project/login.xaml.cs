using Diplom_Project.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Diplom_Project
{
    /// <summary>
    /// Логика взаимодействия для login.xaml
    /// </summary>
    public partial class login : Window
    {
        public string user_group="guest";
        public string IDLogin = "1";
        public login()
        {
            InitializeComponent();
            

        }
            private void Auth_Click(object sender, RoutedEventArgs e)
        {

            string connectionString = "Data Source=DESKTOP-BO3FJ1E\\SQLEXPRESS;Initial Catalog=logistic_services;Integrated Security=true";

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand command = new SqlCommand("Select * from logins where Login_name ='" + Login.Text + "' and [passwords] = '" + Password.Password + "'", conn);
            //MessageBox.Show("Select * from logins where Login_name ='" + Login.Text + "' and [passwords] = '" + Password.Text + "'");
            SqlDataReader reader = command.ExecuteReader();
            List<logins> logins = new List<logins>();
            if (reader.Read())
            {
                user_group = Convert.ToString(reader["id_user_group"]);
                IDLogin = Convert.ToString(reader["id_login"]);
                DialogResult = true;
                
            }
            else
            {
                MessageBox.Show("Неправильный логин или пароль");
            //    DialogResult = false;
            }
            /*while ()
            {
                if 
                logins.Add(new logins(Convert.ToInt32(reader["id_login"]),Convert.ToString(reader["Login_name"]), Convert.ToInt32(reader["id_people"]), Convert.ToInt32(reader["id_user_group"]), Convert.ToString(reader["password"])));
            }*/
            reader.Close();
            conn.Close();

        }

        private void exit_Click(object sender, RoutedEventArgs e)
        {
            DialogResult=false;

        }
    }
}
