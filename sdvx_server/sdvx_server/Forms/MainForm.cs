using MaterialSkin.Controls;
using sdvx_server.Managers;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace sdvx_server.Forms
{
    public partial class MainForm : MaterialForm
    {
        private OSCManager _oscManager = null;
        public MainForm()
        {
            InitializeComponent();
            _oscManager = new OSCManager();
            _oscManager.PropertyChanged += OscManager_PropertyChanged;
        }

        private void OscManager_PropertyChanged(object sender, PropertyChangedEventArgs e)
        {
            if (e.PropertyName == "Messages")
            {
                updateMessages();
            }
        }

        private void startBtn_Click(object sender, EventArgs e)
        {
            _oscManager.openUDPListener(int.Parse(txtPort.Text));
        }

        private void MainForm_Shown(object sender, EventArgs e)
        {
            _oscManager.InitManager();
            updateMessages();
        }

        private void updateMessages()
        {
            txtMessages.Text = _oscManager.Messages;
        }
    }
}
