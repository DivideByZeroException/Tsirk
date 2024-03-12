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
    /// 
    public partial class UserList{
        int id;
        string name;
        string last_name;
        string role;

        public UserList(int id, string name, string last_name, string role)
        {
            this.id = id;
            this.name = name;
            this.last_name = last_name;
            this.role = role;
        }

        public int Id { get => id; set => id = value; }
        public string Name { get => name; set => name = value; }
        public string Last_name { get => last_name; set => last_name = value; }
        public string Role { get => role; set => role = value; }
    }



    public partial class AnimalList
    {
        int id;
        string name;
        string aviary;


        public AnimalList(int id, string name, string aviary)
        {
            this.Id = id;
            this.Name = name;
            this.Aviary = aviary;

        }

        public int Id { get => id; set => id = value; }
        public string Name { get => name; set => name = value; }
        public string Aviary { get => aviary; set => aviary = value; }
    }





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
            var aviarys = DBConn.db.Aviaries.ToList();
            foreach (var aviary in aviarys)
            {
                aviary_box.Items.Add(new Aviaries() { id = aviary.id, title = aviary.title });
            }
            UserListFill();
            AnimalsListFill();
            AviaryListFill();

        }
        public void UserListFill()
        {
            var users = DBConn.db.Users.ToList();
            foreach (var user in users)
            {
                var urole = DBConn.db.Roles.Where(z => z.id == user.role).FirstOrDefault().title;
                users_list.Items.Add(new UserList(user.id, user.name, user.last_name, urole));
            }
        }

        public void AnimalsListFill()
        {
            var animals = DBConn.db.Animals.ToList();
            foreach (var animal in animals)
            {
                var aviary = DBConn.db.Aviaries.Where(z => z.id == animal.aviary).FirstOrDefault().title;
                animals_list.Items.Add(new AnimalList(animal.id, animal.name, aviary));
            }
        }
        public void AviaryListFill()
        {
            var aviarys = DBConn.db.Aviaries.ToList();
            foreach (var av in aviarys)
            {

                aviarys_list.Items.Add(new Aviaries() { id=av.id,title = av.title});
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
                    users_list.Items.Clear();
                    UserListFill();
                }
            }
        }

        private void select_user_Click(object sender, RoutedEventArgs e)
        {
            if(users_list.SelectedItem != null )
            {
                if (((UserList)users_list.SelectedItem).Role == "Артист") {
                    ActorProfile actorProfile = new ActorProfile(((UserList)users_list.SelectedItem).Id);
                    actorProfile.Show();
                }
                if (((UserList)users_list.SelectedItem).Role == "Дрессировщик")
                {
                    TrainerProfile trainer = new TrainerProfile();
                    trainer.Show();
                }
                if (((UserList)users_list.SelectedItem).Role == "Обслуживающий персонал")
                {
                    WorkerProfile worker = new WorkerProfile();
                    worker.Show();
                }
            }
        }

        private void delete_user_Click(object sender, RoutedEventArgs e)
        {
            if (users_list.SelectedItem != null && ((UserList)users_list.SelectedItem).Role != "Администратор" )
            {
                var user = DBConn.db.Users.Where(z => z.id == ((UserList)users_list.SelectedItem).Id).FirstOrDefault();
                DBConn.db.Users.Remove(user);
                DBConn.db.SaveChanges();
                users_list.Items.Clear();
                UserListFill();
            }
        }

        private void add_animal_Click(object sender, RoutedEventArgs e)
        {
            if (animal_box.Text != "" && aviary_box.SelectedItem != null) {
                Animals animals = new Animals();
                animals.name = animal_box.Text;
                animals.aviary = (int)aviary_box.SelectedValue;
                DBConn.db.Animals.Add(animals);
                DBConn.db.SaveChanges();
                animals_list.Items.Clear();
                AnimalsListFill();
            }
        }

        private void delete_animal_Click(object sender, RoutedEventArgs e)
        {
            if (((AnimalList)animals_list.SelectedItem) != null)
            {
                var animal = DBConn.db.Animals.Where(z => z.id == ((AnimalList)animals_list.SelectedItem).Id).FirstOrDefault();
                DBConn.db.Animals.Remove(animal);
                DBConn.db.SaveChanges();
                animals_list.Items.Clear();
                AnimalsListFill();
            }
        }

        private void add_aviary_Click(object sender, RoutedEventArgs e)
        {
            if (aviary_title_box.Text != "" )
            {
                Aviaries av = new Aviaries();
                av.title = aviary_title_box.Text;
              
                DBConn.db.Aviaries.Add(av);
                DBConn.db.SaveChanges();
                aviarys_list.Items.Clear();
                AviaryListFill();
            }
        }

        private void delete_aviary_Click(object sender, RoutedEventArgs e)
        {
            if (((Aviaries)aviarys_list.SelectedItem) != null)
            {
                var av = DBConn.db.Aviaries.Where(z => z.id == ((Aviaries)aviarys_list.SelectedItem).id).FirstOrDefault();
                DBConn.db.Aviaries.Remove(av);
                DBConn.db.SaveChanges();
                aviarys_list.Items.Clear();
                AviaryListFill();
            }
        }
    }
}
