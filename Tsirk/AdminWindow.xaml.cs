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
using System.Windows.Shapes;

namespace Tsirk
{
    /// <summary>
    /// Логика взаимодействия для AdminWindow.xaml
    /// </summary>
    public partial class AdminWindow : Window
    {
        public AdminWindow()
        {
            InitializeComponent();
            var roles = DBConn.db.Roles.ToList();
            foreach(var role in roles)
            {
                role_box.Items.Add(new Roles() { id = role.id,title=role.title});
            }
  
        }

        private void signup_Click(object sender, RoutedEventArgs e)
        {
            if(login_box.Text!=""&&password_box.Text!=""&& name_box.Text!=""&& last_name_box.Text != ""&& role_box.SelectedItem!=null) {
                var user = DBConn.db.Users.Where(z => z.login == login_box.Text).FirstOrDefault();
                if (user == null)
                {
                    var new_user = new Users() { };

                    new_user.login = login_box.Text;
                    new_user.password = password_box.Text;
                        new_user.name = name_box.Text;
                        new_user.last_name = last_name_box.Text;
                        new_user.role = (int)role_box.SelectedValue;
                   
                    DBConn.db.Users.Add(new_user) ;
                    DBConn.db.SaveChanges();
                }
            }
        }
    }
}
