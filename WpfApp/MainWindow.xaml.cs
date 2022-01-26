using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
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

namespace WpfApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>

    public partial class MainWindow : Window
    {

        private readonly List<string> Urls;
        private bool InProcess = false;
        private Dictionary<string, int> Pairs = new Dictionary<string, int>();


        public MainWindow()
        {
            InitializeComponent();

            // Из файла в List
            this.Urls = File.ReadAllLines(@"urls.txt").ToList();
        }

        async Task GetTask(string uri)
        {
            HttpClient client = new HttpClient();
            try
            {
                HttpResponseMessage response = await client.GetAsync(uri);
                response.EnsureSuccessStatusCode();
                string responseBody = await response.Content.ReadAsStringAsync();

                int r = this.CalculateA(responseBody);

                if (!this.Pairs.ContainsKey(uri))
                    this.Pairs.Add(uri, r);
                
                //Вывести наибольший
                MaxResult.Text = MaxUri(r, uri);
                
                //return
            }
            catch (HttpRequestException e)
            {
                MessageBox.Show(e.Message);
            }
        }

        private int CalculateA(string html)
        {
            // В задаче было просто подсчитать, без дальнейшей обработки
            int result = 0;
            for (int i = 0; i < html.Length; i++)
            {
                if ((html[i] == '<' && html[i + 1] == 'a') && (html[i + 2] == ' ' || html[i + 2] == '>'))
                {
                    result++;
                }
            }
            return result;
        }

        private string MaxUri(int i, string s)
        {
            foreach (var item in this.Pairs)
            {
                if (item.Value > i)
                {
                    s = item.Key;
                }
            }

            return s;
        }

        public async void GetHtml()
        {
            int i = 0;
            double x = 100 / this.Urls.Count;

            while (this.Urls.Count > i && this.InProcess == true)
            {
                await this.GetTask(this.Urls[i]);
                ProgressBar.Value += x;
                i++;
            }
            if (i == this.Urls.Count) ProgressBar.Value = 100;
        }

        private void Button_Click_Result(object sender, RoutedEventArgs e)
        {
            foreach (var item in this.Pairs)
            {
                TaskText.Text += '\n' + item.Key + " - " + item.Value;
            }
        }

        private void Button_Click_Start(object sender, RoutedEventArgs e)
        {
            this.InProcess = true;

            MaxResult.Text = "";
            ProgressBar.Value = 0;

            this.GetHtml();
        }

        private void Button_Click_Stop(object sender, RoutedEventArgs e)
        {
            this.InProcess = false;
        }
    }
}
