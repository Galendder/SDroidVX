using SharpOSC;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using vJoyInterfaceWrap;

namespace sdvx_server.Managers
{
    class OSCManager: INotifyPropertyChanged
    {
        static public vJoy joystick;
        static public vJoy.JoystickState iReport;
        static public uint id = 1;
        private UDPListener _udpListener;
        private string _messages = "";

        public string Messages 
        { 
            get => _messages;
            set 
            { 
                _messages = value;
                OnPropertyChanged();
            }
        }

        protected void OnPropertyChanged([CallerMemberName] string name = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
        }

        public event PropertyChangedEventHandler PropertyChanged;

        public void InitManager()
        {
            // VIRTUAL GAMEPAD INITIALIZATION
            Messages = String.Concat(Messages, "\n", "[PAD] Initializing gamepad");
            joystick = new vJoy();
            iReport = new vJoy.JoystickState();

            if (!joystick.vJoyEnabled())
            {
                Messages = String.Concat(Messages, "\n", "[PAD] vJoy driver not enabled!");
                return;
            }
            else
            {
                Messages = String.Concat(Messages, "\n", String.Format("[PAD] Vendor: {0}\n[PAD] Product :{1}\n[PAD] Version Number:{2}", joystick.GetvJoyManufacturerString(), joystick.GetvJoyProductString(), joystick.GetvJoySerialNumberString()));
            }

            VjdStat status = joystick.GetVJDStatus(id);

            int nButtons = joystick.GetVJDButtonNumber(id);

            if (nButtons < 7)
            {
                Messages = String.Concat(Messages, "\n", "[PAD] This app needs at least 7 buttons configured in vJoy to work.");
                return;
            }
            else
            {
                Messages = String.Concat(Messages, "\n", "[PAD] Available buttons: " + nButtons);
            }

            bool sliderR = joystick.GetVJDAxisExist(id, HID_USAGES.HID_USAGE_SL0);
            bool sliderL = joystick.GetVJDAxisExist(id, HID_USAGES.HID_USAGE_SL1);

            if (sliderR && sliderL)
            {
                Messages = String.Concat(Messages, "\n", "[PAD] Sliders enabled");
            }
            else
            {
                Messages = String.Concat(Messages, "\n", "[PAD] This app needs at least 2 sliders configured in vJoy to work.");
                return;
            }

            if ((status == VjdStat.VJD_STAT_OWN) || ((status == VjdStat.VJD_STAT_FREE) && (!joystick.AcquireVJD(id))))
            {
                Messages = String.Concat(Messages, "\n", String.Format("[PAD] Failed to acquire vJoy device number {0}.", id));
                return;
            }
            else
            {
                Messages = String.Concat(Messages, "\n", String.Format("[PAD] Acquired: vJoy device number {0}.", id));
            }

        }

        public void openUDPListener(int port)
        {
            Messages = String.Concat(Messages, "\n", String.Format("Now listening on port {0}", port.ToString()));
            HandleOscPacket callback = packet =>
            {
                OSCMessageListener(packet);
            };
            this._udpListener = new UDPListener(port, callback);

        }

        public void closeUDPListener()
        {
            this._udpListener.Close();
        }

        private void OSCMessageListener(OscPacket packet)
        {
            var messageReceived = (OscMessage)packet;
            string addr = messageReceived.Address;
            string content = messageReceived.Arguments[0].ToString();
            bool value = content == "P" ? true : false;

            switch (messageReceived.Address)
            {
                case "/btn-a":
                    joystick.SetBtn(value, id, 1);
                    break;

                case "/btn-b":
                    joystick.SetBtn(value, id, 2);
                    break;

                case "/btn-c":
                        joystick.SetBtn(value, id, 3);
                    break;

                case "/btn-d":
                        joystick.SetBtn(value, id, 4);
                    break;
                case "/fx-l":
                        joystick.SetBtn(value, id, 5);
                    break;
                case "/fx-r":
                        joystick.SetBtn(value, id, 6);
                    break;
                case "/start":
                        joystick.SetBtn(value, id, 7);
                    break;

                case "/vol-l":
                    int lPos = int.Parse(content);
                    joystick.SetAxis(lPos * 400, id, HID_USAGES.HID_USAGE_SL0);
                    break;
                case "/vol-r":
                    int rPos = int.Parse(content);
                    joystick.SetAxis(rPos * 400, id, HID_USAGES.HID_USAGE_SL1);
                    break;
            }
        }
    }
}
