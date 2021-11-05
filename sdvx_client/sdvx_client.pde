import controlP5.*;

import netP5.*;
import oscP5.*;

// Open Sound Control libraries
OscP5 oscP5;
NetAddress serverAddress; 

// Connection informations
String serverIP;
String serverPort;

// Network event manager
OSCManager oscManager;


// Button objects
Button btn_a, btn_b, btn_c, btn_d;
Button fx_l, fx_r;
Button start;

Slider vol_l, vol_r;

// Menu objects
Menu_Settings menu;
boolean menuOpened = false;

// Button colors
color mainBtnColor = color(45, 219, 184);
color fxBtnColor = color(201, 20, 51);
color volLColor = color(107, 241, 253);
color volRColor = color(255, 118, 255);

// Application fonts
PFont mainFont;

float lastRPos;
float currRPos;

float lastLPos;
float currLPos;

void setup()
{
  // oscP5 setup  
  // Change the IP address below to the IP of your computer
  oscP5 = new OscP5(this, 12000);
  serverIP = "192.168.15.10";
  serverPort = "32000";
  serverAddress = new NetAddress(serverIP, Integer.parseInt(serverPort));
  
  // Network event manager
  oscManager = new OSCManager();
  
  // Screen setup
  fullScreen();
  orientation(LANDSCAPE);
  frameRate(60);
  
  // Font
  mainFont = createFont("Teko-SemiBold.ttf", 36, true);
  
  InitButtons();

  // Menu

  menu = new Menu_Settings(this);
  
  lastRPos = 0;
  currRPos = 0;
  lastLPos = 0;
  currLPos = 0;
}

void InitButtons()
{  
  // Layout sizes
  int mainBtnSize = width/4;
  int margins = (height - mainBtnSize)/2;
  
  // Main buttons
  btn_a = new Button(0, margins, mainBtnSize, mainBtnSize, mainBtnColor, "BTN-A");
  btn_b = new Button(mainBtnSize*1, margins, mainBtnSize, mainBtnSize, mainBtnColor, "BTN-B");
  btn_c = new Button(mainBtnSize*2, margins, mainBtnSize, mainBtnSize, mainBtnColor, "BTN-C");
  btn_d = new Button(mainBtnSize*3, margins, mainBtnSize, mainBtnSize, mainBtnColor, "BTN-D");
  
  // FX buttons
  fx_l = new Button(0, margins + mainBtnSize, mainBtnSize*2, margins, fxBtnColor, "FX-L");
  fx_r = new Button(mainBtnSize*2, margins + mainBtnSize, mainBtnSize*2, margins, fxBtnColor, "FX-R");
  
  // Start button
  start = new Button((width/2)-(margins/4), 0, margins/2, margins, color(0, 0, 255), "ST");
  
  // Sliders
  vol_l = new Slider(0, 0, (mainBtnSize*2)-(margins/4), margins, volLColor, "VOL-L");
  vol_r = new Slider((width/2)+(margins/4), 0, mainBtnSize*2-(margins/4), margins, volRColor, "VOL-R");
}

void draw()
{
    background(15, 28, 36);  
    textFont(mainFont);
    // If Menu is shown, we don't update controller buttons.
    mainLoop();
    if(start.pressedMoreThanFiveSeconds())
    {
        start.resetTimer();
        menu.openSettingsMenu();
    }

}

void mainLoop()
{
// Update button states
    // Main buttons
    btn_a.update();    
    btn_b.update();
    btn_c.update();
    btn_d.update();
    
    // FX Buttons
    fx_l.update();
    fx_r.update();
    
    // Volume Buttons
    vol_l.update();
    vol_r.update();
    
    start.update();
  
    
    // Send OSC messages
    oscManager.sendOscMessages();
    
    // Main buttons
    btn_a.draw();    
    btn_b.draw();
    btn_c.draw();
    btn_d.draw();
    
    // FX Buttons
    fx_l.draw();
    fx_r.draw();  
    
    // Volume Buttons
    vol_l.draw();
    vol_r.draw();
    
    // Draw everything
    start.draw();
}
