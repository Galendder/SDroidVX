using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using sdvx_server.Forms;
using SharpOSC;
using vJoyInterfaceWrap;

namespace sdvx_server
{
    class Program
    {


        static void Main(string[] args)
        {
            Form mainForm = new MainForm();
            mainForm.ShowDialog();
            
        }
    }
}
