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
    /// Interaction logic for ActorProfile.xaml
    /// </summary>
    public partial class ActorProfile : Window
    {
        int uid;
        public ActorProfile(int id)
        {
            InitializeComponent();
            uid = id;
            
          
        }
        public void Upd()
        {
            var timesheet = DBConn.db.Timesheet.Where(z => z.id == uid).ToList();
            foreach (var t in timesheet)
            {
                times_list.Items.Add(new Timesheet() { id = t.id, date = t.date });
            }
        }
        private void add_Click(object sender, RoutedEventArgs e)
        {
            var t = new Timesheet();
            t.user_id = uid;
            t.date = (DateTime)date.SelectedDate;
            DBConn.db.Timesheet.Add(t);
            DBConn.db.SaveChanges();
            times_list.Items.Clear();
            Upd();
        }
    }
}
