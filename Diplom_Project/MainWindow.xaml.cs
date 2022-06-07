using System;
using System.Collections.Generic;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Data;
using System.Data.SqlClient;

using Diplom_Project.Entities;

namespace Diplom_Project
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        SqlConnection conn;
        public int LoginGroup = 4;//1 - админ, 2 - менеджер, 3 - клиент, 4 - гость
        public string  IDLogin="2";
        public MainWindow()
        {
            InitializeComponent();

            string connectionString = "Data Source=DESKTOP-BO3FJ1E\\SQLEXPRESS;Initial Catalog=logistic_services;Integrated Security=true";
            login Log = new login();
            conn = new SqlConnection(connectionString);
            conn.Open();
            //Формирование грида предзаказ
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT  TOP(1000)[id_PreOrder],[Start_location],[End_location],[Order_date],[End_date],[weight],[dimensions],FIO FROM[logistic_services].[dbo].[PreOrder_2] join logins on (logins.id_login = PreOrder_2.id_login) join People on (logins.id_people = People.id_people)", conn);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            PreOrder_grid.ItemsSource = ds.Tables[0].DefaultView;
            //dataGrid.Columns["name"].Visibility = Visibility.Hidden;

            string ss= "SELECT TOP (1000) [id_order],[start_location],[ends_location],[order_date],[finish_date],[cargo_name],[cost],[weight],[dimensions]," +
                "p2.FIO,p1.FIO, [statusorder_name] FROM [logistic_services].[dbo].[orders] join logins on (logins.id_login = orders.id_manager) " +
                "join People p2 on (logins.id_people = p2.id_people) " +
                "join statusorder on (orders.id_statusorder = statusorder.id_statusorder)" +
                " join cargo on (orders.id_cargo = cargo.id_cargo)" +
                " join Staff on (Staff.id_staff = orders.id_manager) " +
                "join People p1 on (Staff.id_people = p1.id_people) " +
                " where  (statusorder_name = 'Исполнен' or statusorder_name = 'Отменен' ) ";//вместо 1 поставить IDLogin 
            //r.AppendText(ss);
            SqlDataAdapter sqlDataAdapter1 = new SqlDataAdapter(ss, conn) ; 
            
            DataSet dataSet1 = new DataSet();
            sqlDataAdapter1.Fill(dataSet1);
            EndS.ItemsSource = dataSet1.Tables[0].DefaultView;

            //окончание оформлениягрида па предзаказ

            SqlDataAdapter adapterorder = new SqlDataAdapter(
                "SELECT id_order, p.FIO as manager,people.FIO " +
                "as client,[start_location],[ends_location],[distance],[order_date],[finish_date]," +
                "[loaders],[price],[cost],[weight],[dimensions], " +
                "ExAuto.gos_number, cargo.cargo_name, auto.model, auto.stamp " +
                "FROM [logistic_services].[dbo].[orders] o   " +
                "join ExAuto on (o.id_exauto=ExAuto.id_exauto)   " +
                "join cargo on (o.id_cargo = cargo.id_cargo)   " +
                "join client on (client.id_clients=o.id_client) " +
                "join people on (client.id_contact_person=people.id_people)   " +
                "join staff on (staff.id_staff = o.id_manager)   " +
                "join people p on (staff.id_people=p.id_people) " +
                "join auto on (ExAuto.id_auto = auto.id_auto) where id_statusorder=1", conn);
            DataSet dsorder = new DataSet();
            adapterorder.Fill(dsorder);
            ReadyOrder.ItemsSource = dsorder.Tables[0].DefaultView;

            SqlDataAdapter preorder2ndpage = new SqlDataAdapter("SELECT TOP(1000)[id_PreOrder],[Start_location],[End_location],[Order_date],[End_date],[weight],[dimensions],[id_login]FROM[logistic_services].[dbo].[PreOrder_2]", conn);
            DataSet dspreorder2 = new DataSet();
            preorder2ndpage.Fill(dspreorder2);            
            StatusOrder_grid.ItemsSource = dspreorder2.Tables[0].DefaultView;
           
            StatusOrder_grid.Items.Refresh();
           

            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("SELECT [id_order],[id_driver],[id_exauto],[id_cargo],[start_location],[ends_location],[distance],[order_date],[finish_date],[loaders],[price],[cost],[weight],[dimensions],[id_client],[id_manager],[id_statusorder] FROM[dbo].[orders] where id_statusorder = 2 or id_statusorder = 3", conn);
            DataSet dataSet = new DataSet();    
            sqlDataAdapter.Fill(dataSet);
            report_DG.ItemsSource = dataSet.Tables[0].DefaultView;

            if (Log.ShowDialog() == true )
            {
                IDLogin = Log.IDLogin;
                if (Log.user_group == "1")
                {
                   
                }
                if (Log.user_group == "2")
                {
                   

                }
                if (Log.user_group == "3")
                {
                   
                }
                if (Log.user_group == "4")
                {
                   
                }
            }
            else
            {
                Close();
            }

            SqlDataAdapter sqlData  = new SqlDataAdapter("SELECT TOP(1000)[id_login],[Login_name],[id_people],[id_user_group],[passwords]FROM[logistic_services].[dbo].[logins]", conn);
            DataSet loginsdata = new DataSet(); 
            sqlData.Fill(loginsdata);
            logins_add.ItemsSource = loginsdata.Tables[0].DefaultView;

            SqlDataAdapter staffsql = new SqlDataAdapter("SELECT TOP(1000)[id_staff],[id_people],[id_post],[bonus] FROM[logistic_services].[dbo].[staff]", conn);
            DataSet staffdata = new DataSet();
            staffsql.Fill(staffdata);
            staff_add.ItemsSource = staffdata.Tables[0].DefaultView;
        }

        private void add_Click(object sender, RoutedEventArgs e)
        {

        }

        private void update_Click(object sender, RoutedEventArgs e)
        {

        }

        private void PreOrder_grid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
        private string GetnextID(string ID,string TableName)
        {
            string s = "Select max(" + ID + ") from " + TableName;
            SqlCommand command = new SqlCommand("Select max(" + ID + ") "+ID+" from " + TableName, conn);
            //r.AppendText("\nSelect max(" + ID + ") " + ID + " from " + TableName);
            SqlDataReader reader1 = command.ExecuteReader();
            if (reader1.Read())
            {
                string res = Convert.ToString(Convert.ToInt64(reader1[ID]) + 1);
                reader1.Close();
                return res;
            }
            else 
                return "";
        }
        private void Send_Order_Click(object sender, RoutedEventArgs e)
        {
            string s = "INSERT INTO [dbo].[PreOrder_2] " +
           "([id_PreOrder] ,[Start_location],[End_location],[Order_date],[End_date],[weight],[dimensions],[id_login]) " +
           "VALUES" +
           "(" + GetnextID("id_PreOrder", "PreOrder_2") + ", '" + Start_location.Text + "', '" + End_location.Text + "'" +
           ", '" + Start_date.Text + "', '" + End_date.Text + "', " + Weight_PreO.Text + "," + Dimensions_PreO.Text + "," + IDLogin+")";
            SqlDataAdapter adapter2 = new SqlDataAdapter(s, conn);
            //r.AppendText("\n"+s);
            DataTable dt = new DataTable();
            adapter2.Fill(dt);
            SqlDataAdapter preorder2ndpage = new SqlDataAdapter("SELECT TOP(1000)[id_PreOrder],[Start_location],[End_location],[Order_date],[End_date],[weight],[dimensions],[id_login]FROM[logistic_services].[dbo].[PreOrder_2]", conn);
            DataSet dspreorder2 = new DataSet();
            preorder2ndpage.Fill(dspreorder2);
            StatusOrder_grid.ItemsSource = dspreorder2.Tables[0].DefaultView;
            PreOrder_grid.ItemsSource = dspreorder2.Tables[0].DefaultView;


        }
        private string ConvertDate(string s)
        {
            return "2022/2/2";
        }
        private void UpdateOrder_button_Click(object sender, RoutedEventArgs e)
        {
            if (StatusOrder_grid.SelectedIndex == -1) { return; }
            DataGridRow row = (DataGridRow)StatusOrder_grid.ItemContainerGenerator.ContainerFromIndex(StatusOrder_grid.SelectedIndex);
            if (row != null)
            {
                TextBlock strloc = StatusOrder_grid.Columns[1].GetCellContent(row) as TextBlock;
                TextBlock ordDate = StatusOrder_grid.Columns[3].GetCellContent(row) as TextBlock;
                string cordDate = ConvertDate(ordDate.Text);
                TextBlock endloc = StatusOrder_grid.Columns[2].GetCellContent(row) as TextBlock;
                TextBlock weighT = StatusOrder_grid.Columns[5].GetCellContent(row) as TextBlock;
                TextBlock DimensionsT = StatusOrder_grid.Columns[6].GetCellContent(row) as TextBlock;
                TextBlock ClientT = StatusOrder_grid.Columns[7].GetCellContent(row) as TextBlock;

                //Data = tbl.Text;                
                string s = "INSERT INTO [dbo].[orders] ([id_order],[id_driver],[id_exauto],[id_cargo],[start_location],[ends_location],[distance],[order_date],[finish_date],[loaders],[price],[cost],[weight],[dimensions],[id_client],[id_manager],[id_statusorder])" +
            "VALUES" +
            "("+GetnextID("id_order", "orders") +","+ Convert.ToString(DriverSelect_CB.SelectedIndex + 1) + ","+ Convert.ToString(CarSelect.SelectedIndex + 1) + "," + Convert.ToString(CargoSelect.SelectedIndex + 1) + ",\'" + strloc.Text + "\',\'" + endloc.Text + "\'," + distance.Text + ",\'" + cordDate + "\',\'" + Finishdate.Text + "\'," + loaderscount.Text + "," + priceTB.Text + "," + costTB.Text + "," + weighT.Text + "," + DimensionsT.Text + "," + ClientT.Text + "," + IDLogin + "," + Convert.ToString(StatusOrder_CB.SelectedIndex+1) + ")";
                SqlDataAdapter adapter3 = new SqlDataAdapter(s, conn);
                DataTable dt = new DataTable();
                
                adapter3.Fill(dt);

                // переделать запрос селекта как в примере выше

                SqlDataAdapter order2ndpage = new SqlDataAdapter("SELECT TOP (1000) [id_order],[id_driver],[id_exauto],[id_cargo],[start_location],[ends_location],[distance],[order_date],[finish_date],[loaders],[price],[cost],[weight],[dimensions],[id_client],[id_manager],[id_statusorder] FROM [logistic_services].[dbo].[orders]", conn);
                DataSet dspreorder2 = new DataSet();
                order2ndpage.Fill(dspreorder2);
                ReadyOrder.ItemsSource = dspreorder2.Tables[0].DefaultView;
                row = (DataGridRow)StatusOrder_grid.ItemContainerGenerator.ContainerFromIndex(StatusOrder_grid.SelectedIndex);
                DataGridRow row1 = (DataGridRow)StatusOrder_grid.ItemContainerGenerator.ContainerFromIndex(StatusOrder_grid.SelectedIndex);
                TextBlock TB = StatusOrder_grid.Columns[0].GetCellContent(row1) as TextBlock;
                string ss = "DELETE FROM PreOrder_2 WHERE id_PreOrder = " + TB.Text;
                SqlDataAdapter adapteR = new SqlDataAdapter(ss, conn);
                DataTable dataTable = new DataTable();
                adapteR.Fill(dataTable);
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("SELECT TOP(1000)[id_PreOrder],[Start_location],[End_location],[Order_date],[End_date],[weight],[dimensions],[id_login] FROM[logistic_services].[dbo].[PreOrder_2]", conn);
                DataSet dataSet = new DataSet();
                sqlDataAdapter.Fill(dataSet);
                StatusOrder_grid.ItemsSource = dataSet.Tables[0].DefaultView;
                

            }            
            
            //DataTable dt = new DataTable();
            //adapter2.Fill(dt);
        }

        private void Button_Click(object sender, RoutedEventArgs e)
             
        {
            if (typereport.SelectedIndex==0)
            { 
                SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT[id_order],[id_driver],[id_exauto],[id_cargo],[start_location],[ends_location],[distance],[order_date],[finish_date],[loaders],[price],[cost],[weight],[dimensions],[id_client],[id_manager],[id_statusorder] FROM[dbo].[orders] where(id_statusorder = 2 ) and(finish_date >= '"+Year_start.Text +"' and finish_date <= '"+Year_middle.Text+"') ", conn);
                DataSet ds = new DataSet();
                dataAdapter.Fill(ds);
                report_DG.ItemsSource = ds.Tables[0].DefaultView;

                string s = "SELECT sum(price) as price FROM[dbo].[orders] where(id_statusorder = 2 ) and(finish_date >= '" + Year_start.Text + "' and finish_date <= '" + Year_middle.Text + "') ";
                //SqlDataAdapter dataAdapter1 = new SqlDataAdapter(s, conn);
                //DataSet ds1 = new DataSet();
                //dataAdapter1.Fill(ds1);
                //Sumreport.Content = ds1.Tables[0].Columns["price"];
                SqlCommand command = new SqlCommand("SELECT[id_order],[id_driver],[id_exauto],[id_cargo],[start_location],[ends_location],[distance],[order_date],[finish_date],[loaders],[price],[cost],[weight],[dimensions],[id_client],[id_manager],[id_statusorder] FROM[dbo].[orders] where(id_statusorder = 2 ) and  (finish_date >= '" + Year_start.Text + "' and finish_date <= '" + Year_middle.Text + "') ", conn);
                //MessageBox.Show("Select * from logins where Login_name ='" + Login.Text + "' and [passwords] = '" + Password.Text + "'");
                SqlDataReader reader = command.ExecuteReader();
                List<logins> logins = new List<logins>();
                double summ = 0;
                while (reader.Read())
                {
                    
                    summ += Convert.ToDouble( reader["price"]);
                }
                Sumreport.Content = summ.ToString();
            }
            if (typereport.SelectedIndex == 1)
            {
                SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT[id_order],[id_driver],[id_exauto],[id_cargo],[start_location],[ends_location],[distance],[order_date],[finish_date],[loaders],[price],[cost],[weight],[dimensions],[id_client],[id_manager],[id_statusorder] FROM[dbo].[orders] where(id_statusorder = 3) and(finish_date >= '"+Year_start+"' and finish_date <= '"+Year_middle+"')", conn);
                DataSet set = new DataSet();
                dataAdapter.Fill(set);
                report_DG.ItemsSource = set.Tables[0].DefaultView;

                SqlCommand command = new SqlCommand("SELECT[id_order],[id_driver],[id_exauto],[id_cargo],[start_location],[ends_location],[distance],[order_date],[finish_date],[loaders],[price],[cost],[weight],[dimensions],[id_client],[id_manager],[id_statusorder] FROM[dbo].[orders] where(id_statusorder = 3 ) and(finish_date >= '" + Year_start.Text + "' and finish_date <= '" + Year_middle.Text + "') ", conn);
                //MessageBox.Show("Select * from logins where Login_name ='" + Login.Text + "' and [passwords] = '" + Password.Text + "'");
                SqlDataReader reader = command.ExecuteReader();
                List<logins> logins = new List<logins>();
                double summ = 0;
                while (reader.Read())
                {
                    summ += Convert.ToDouble(reader["price"]);


                }
                Sumreport.Content = summ.ToString();
            }
            


        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            DataGridRow row = (DataGridRow)ReadyOrder.ItemContainerGenerator.ContainerFromIndex(ReadyOrder.SelectedIndex);
            if (row != null)
            {
                TextBlock numberorder = StatusOrder_grid.Columns[0].GetCellContent(row) as TextBlock;

                string ss = "UPDATE [dbo].[orders]"
                        +" SET [id_statusorder] = " + Convert.ToString(StatusOrder_CB.SelectedIndex + 2 )+
                        " WHERE [id_order] = "+numberorder.Text;
                SqlDataAdapter adapteR = new SqlDataAdapter(ss, conn);
                DataTable dataTable = new DataTable();
                adapteR.Fill(dataTable);
            
            
            }
            SqlDataAdapter adapterorder = new SqlDataAdapter(
               "SELECT id_order, p.FIO as manager,people.FIO " +
               "as client,[start_location],[ends_location],[distance],[order_date],[finish_date]," +
               "[loaders],[price],[cost],[weight],[dimensions], " +
               "ExAuto.gos_number, cargo.cargo_name, auto.model, auto.stamp " +
               "FROM [logistic_services].[dbo].[orders] o   " +
               "join ExAuto on (o.id_exauto=ExAuto.id_exauto)   " +
               "join cargo on (o.id_cargo = cargo.id_cargo)   " +
               "join client on (client.id_clients=o.id_client) " +
               "join people on (client.id_contact_person=people.id_people)   " +
               "join staff on (staff.id_staff = o.id_manager)   " +
               "join people p on (staff.id_people=p.id_people) " +
               "join auto on (ExAuto.id_auto = auto.id_auto) where id_statusorder=1", conn);
            DataSet dsorder = new DataSet();
            adapterorder.Fill(dsorder);
            ReadyOrder.ItemsSource = dsorder.Tables[0].DefaultView;
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {

            string id = GetnextID("id_people", "People");
            string s = "INSERT INTO [dbo].[People] " +
           "([id_people] ,[FIO],[Passport] ,[Birthday] ,[Telefone]) " +
           " VALUES " +
           "(" + id + ", '" + fioTB.Text + "', '" + passportTB.Text + "'" +
           ", '" + BirthDayDP.Text + "', '" + phonenumTB.Text + "')";
            SqlDataAdapter adapter3 = new SqlDataAdapter(s, conn);
            DataSet setCliControl = new DataSet();
            adapter3.Fill(setCliControl);
           
           string sb = "insert into logins ([id_login],[Login_name],[id_people]," +
                "[id_user_group],[passwords]) " +
                "values ("+GetnextID("id_login","logins")+",'"+ loginTB.Text + "'," + id + "," + Convert.ToString(logGroupCB.SelectedIndex+1)+",'"+passwordTB.Text+"')";
            //r.AppendText(sb);
            SqlDataAdapter adapter45 = new SqlDataAdapter(sb, conn);
            DataSet dataSet = new DataSet();
            adapter45.Fill(dataSet);

            // s = "INSERT INTO [dbo].[Logins] " +
            //"([id_PreOrder] ,[Start_location],[End_location],[Order_date],[End_date],[weight],[dimensions],[id_login]) " +
            //"VALUES" +
            //"(" + GetnextID("id_PreOrder", "PreOrder_2") + ", '" + Start_location.Text + "', '" + End_location.Text + "'" +
            //", '" + Start_date.Text + "', '" + End_date.Text + "', " + Weight_PreO.Text + "," + Dimensions_PreO.Text + "," + IDLogin + ")";
            // SqlDataAdapter adapter2 = new SqlDataAdapter(s, conn);

        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            
        }

        private void secondtab_Loaded(object sender, RoutedEventArgs e)
        {
           
        }

        private void StatusOrder_grid_AutoGeneratedColumns(object sender, EventArgs e)
        {
            StatusOrder_grid.Columns[0].Width =0.1;
            

        }

      
        public void PreOrder_grid_AutoGeneratedColumns(object sender, EventArgs e)
        {
            PreOrder_grid.Columns[0].Visibility = Visibility.Hidden;
            PreOrder_grid.Columns[1].Header = "Стартовая т.";
            PreOrder_grid.Columns[2].Header = "Конечная т.";
            PreOrder_grid.Columns[3].Header = "Начало срока исполнения";
            PreOrder_grid.Columns[4].Header = "Конец срока исполнения";
            PreOrder_grid.Columns[5].Header = "Вес груза";
            PreOrder_grid.Columns[6].Header = "Объём груза";
            PreOrder_grid.Columns[7].Header = "ФИО заказчика";
        }

        private void EndS_AutoGeneratedColumns(object sender, EventArgs e)
        {
            EndS.Columns[11].Visibility = Visibility.Hidden;
        }

        private void post_add_Click(object sender, RoutedEventArgs e)
        {
            string id = GetnextID("id_people", "People");
            string s = "INSERT INTO [dbo].[People] " +
           "([id_people] ,[FIO],[Passport] ,[Birthday] ,[Telefone]) " +
           " VALUES " +
           "(" + id + ", '" + FIOpersTB.Text + "', '" + passTB.Text + "'" +
           ", '" + BDayDP.Text + "', '" + phoneTB.Text + "')";
            SqlDataAdapter adapter7 = new SqlDataAdapter(s, conn);
            DataSet workControl = new DataSet();
            adapter7.Fill(workControl);

            string workC = " INSERT INTO[dbo].[staff]([id_staff],[id_people],[id_post],[bonus]) VALUES ("+GetnextID("id_staff","staff") +","+ id +","+ Convert.ToString(post_CB.SelectedIndex+1)+"," + bonus_TB.Text+")";
           SqlDataAdapter sqlDataAdapter89 = new SqlDataAdapter(workC, conn);
            DataSet postControl = new DataSet();
            sqlDataAdapter89.Fill(postControl);
        }

        private void apply_changes_Click(object sender, RoutedEventArgs e)
        {
            DataGridRow row = (DataGridRow)logins_add.ItemContainerGenerator.ContainerFromIndex(logins_add.SelectedIndex);
            if (row != null)
            {
                TextBlock numberlogin = logins_add.Columns[0].GetCellContent(row) as TextBlock;
                string sg = "UPDATE[dbo].[logins] SET [id_user_group] =" + Convert.ToString(change_group_userCB.SelectedIndex + 1) + ",[passwords] ='" + change_passTB.Text + "'  WHERE id_login = " + numberlogin.Text;
                
                SqlDataAdapter adapteR = new SqlDataAdapter(sg, conn);
                DataTable dataTable = new DataTable();
                adapteR.Fill(dataTable);

                

            }
            SqlDataAdapter dataAdapter = new SqlDataAdapter ("SELECT TOP(1000)[id_login],[Login_name],[id_people],[id_user_group],[passwords]FROM[logistic_services].[dbo].[logins]", conn);
            DataSet dataSet = new DataSet();
            dataAdapter.Fill(dataSet);
            logins_add.ItemsSource = dataSet.Tables[0].DefaultView;
        }

        private void staff_changes_apply_Click(object sender, RoutedEventArgs e)
        {
            DataGridRow row = (DataGridRow)staff_add.ItemContainerGenerator.ContainerFromIndex(staff_add.SelectedIndex);
            if (row != null)
            {
                TextBlock numberstaff = staff_add.Columns[0].GetCellContent(row) as TextBlock;
                string sd = " UPDATE[dbo].[staff]   SET [id_post] ="+Convert.ToString(staff_changeCB.SelectedIndex+1)+" ,[bonus] ='"+bonus_changeTB.Text+"'   WHERE id_staff =  " + numberstaff.Text;

                SqlDataAdapter adapter = new SqlDataAdapter(sd, conn);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
            }
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("SELECT TOP(1000)[id_staff],[id_people],[id_post],[bonus] FROM[logistic_services].[dbo].[staff]", conn);
            DataSet set = new DataSet();
            sqlDataAdapter.Fill(set);
            staff_add.ItemsSource = set.Tables[0].DefaultView;
        }
    }
}
