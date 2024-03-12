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

namespace Tsirk
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void signin_Click(object sender, RoutedEventArgs e)
        {
            if(login_box.Text!=""&& password_box.Text != "")
            {
                var user = DBConn.db.Users.Where(z => z.login == login_box.Text).FirstOrDefault();
                if (user != null)
                {
                    if (user.password == password_box.Text)
                    {
                        switch (user.role) {
                            case 1:
                                AdminWindow adminWindow = new AdminWindow();
                                adminWindow.Show();
                                break;
                            case 2:
                                ActorWindow actorWindow = new ActorWindow();
                                actorWindow.Show();
                                break;
                            case 3:
                                TrainerWindow trainerWindow = new TrainerWindow();
                                trainerWindow.Show();
                                break;
                            case 4:
                                WorkerWindow workerWindow = new WorkerWindow();
                                workerWindow.Show();
                                break;
                            default:
                                break;
                        }
                    }
                }
            }
        }
    }
}
