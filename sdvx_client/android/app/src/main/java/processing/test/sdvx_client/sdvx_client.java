package processing.test.sdvx_client;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import netP5.*; 
import oscP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sdvx_client extends PApplet {




// Open Sound Control libraries
OscP5 oscP5;
NetAddress serverAddress; 

// Button objects
Button btn_a, btn_b, btn_c, btn_d;
Button fx_l, fx_r;
Button start;

Slider vol_l, vol_r;

// Button colors
int mainBtnColor = color(45, 219, 184);
int fxBtnColor = color(201, 20, 51);
int volLColor = color(107, 241, 253);
int volRColor = color(255, 118, 255);

// Application fonts
PFont mainFont;

float lastRPos;
float currRPos;

float lastLPos;
float currLPos;

public void setup()
{
  // oscP5 setup  
  // Change the IP address below to the IP of your computer
  oscP5 = new OscP5(this, 12000);
  serverAddress = new NetAddress("192.168.15.10", 32000);
  
  // Screen setup
  
  orientation(LANDSCAPE);
  
  
  // Layout sizes
  int mainBtnSize = width/4;
  int margins = (height - mainBtnSize)/2;
  
  // Font
  mainFont = createFont("Teko-SemiBold.ttf", 36, true);
  
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
  
  lastRPos = 0;
  currRPos = 0;
  
  lastLPos = 0;
  currLPos = 0;
}

public void draw()
{
  background(15, 28, 36);  
  textFont(mainFont);
  
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
  sendOscMessages();
  
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

public void sendOscMessages()
{
  // Dispatch OSC messages for each of the buttons pressed.
  if(btn_a.justPressed())
  {
    OscMessage msg = new OscMessage("/btn-a");
    msg.add("P");
    oscP5.send(msg, serverAddress);
  }
  
  if(btn_a.justReleased())
  {
    OscMessage msg = new OscMessage("/btn-a");
    msg.add("R");
    oscP5.send(msg, serverAddress);
  }
  
  if(btn_b.justPressed())
  {
    OscMessage msg = new OscMessage("/btn-b");
    msg.add("P");
    oscP5.send(msg, serverAddress);
  }
  
  if(btn_b.justReleased())
  {
    OscMessage msg = new OscMessage("/btn-b");
    msg.add("R");
    oscP5.send(msg, serverAddress);
  }
  
  if(btn_c.justPressed())
  {
    OscMessage msg = new OscMessage("/btn-c");
    msg.add("P");
    oscP5.send(msg, serverAddress);
  }
  
  if(btn_c.justReleased())
  {
    OscMessage msg = new OscMessage("/btn-c");
    msg.add("R");
    oscP5.send(msg, serverAddress);
  }
  
  if(btn_d.justPressed())
  {
    OscMessage msg = new OscMessage("/btn-d");
    msg.add("P");
    oscP5.send(msg, serverAddress);
  }
  
  if(btn_d.justReleased())
  {
    OscMessage msg = new OscMessage("/btn-d");
    msg.add("R");
    oscP5.send(msg, serverAddress);
  }
  
  if(fx_l.justPressed())
  {
    OscMessage msg = new OscMessage("/fx-l");
    msg.add("P");
    oscP5.send(msg, serverAddress);
  }
  
  if(fx_l.justReleased())
  {
    OscMessage msg = new OscMessage("/fx-l");
    msg.add("R");
    oscP5.send(msg, serverAddress);
  }
  
  if(fx_r.justPressed())
  {
    OscMessage msg = new OscMessage("/fx-r");
    msg.add("P");
    oscP5.send(msg, serverAddress);
  }
  
  if(fx_r.justReleased())
  {
    OscMessage msg = new OscMessage("/fx-r");
    msg.add("R");
    oscP5.send(msg, serverAddress);
  }
  
  if(start.justPressed())
  {
    OscMessage msg = new OscMessage("/start");
    msg.add("P");
    oscP5.send(msg, serverAddress);
  }
  
  if(start.justReleased())
  {
    OscMessage msg = new OscMessage("/start");
    msg.add("R");
    oscP5.send(msg, serverAddress);
  }


  // In sliders, we send the current slider position as a float
  if(vol_l.getValue() != 0)
  {
    lastLPos = currLPos;
    currLPos = vol_l.getValue();
    
    if(currLPos != lastLPos)
    {
      OscMessage msg = new OscMessage("/vol-l");
      msg.add((int)currLPos);
      oscP5.send(msg, serverAddress);
    }
  } else {
    lastLPos = 0;
    currLPos = 0;
  }
  
  if(vol_r.getValue() != 0)
  {
    lastRPos = currRPos;
    currRPos = vol_r.getValue();
    
    if(currRPos != lastRPos)
    {
      OscMessage msg = new OscMessage("/vol-r");
      msg.add((int)currRPos);
      oscP5.send(msg, serverAddress);
    }
  } else {
    lastRPos = 0;
    currRPos = 0;
  }
}
class Button
{
  int x;
  int y;
  int w;
  int h;
  int mainColor;
  int textColor;
  int currentColor;
  String desc;
  
  boolean justPressed;
  boolean justReleased;
  
  boolean lastPressed;
  boolean currPressed;
  int[] touches;
  
  int padding = 20;
  
  public Button(int x, int y, int w, int h, int mainColor, String desc)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.mainColor = mainColor;
    this.currentColor = mainColor;
    this.desc = desc;
    
    justPressed = false;
    justReleased = false;
    lastPressed = false;
    currPressed = false;
  }
  
  public boolean isInside(int x, int y)
  {
    if(x > this.x && x <= this.x + w &&
       y > this.y && y <= this.y + h)
       return true;
    
    return false;
  }
  
  public void update()
  {    
    lastPressed = currPressed;
    currPressed = false;
    
    justPressed = false;
    justReleased = false;
    
    currentColor = mainColor;
    textColor = color(255);
    
    for (int i = 0; i < touches.length; i++) {
      if(isInside((int)touches[i].x, (int)touches[i].y))
      {
        currPressed = true;
        currentColor = color(255, 255, 255);
        textColor = color(0);
        break;
      }
    }
    
    if(lastPressed && !currPressed)
      justReleased = true;
      
    if(!lastPressed && currPressed)
      justPressed = true;
  }
  
  public boolean justPressed()
  {
    return justPressed;
  }
  
  public boolean justReleased()
  {
    return justReleased;
  }
  
  public void draw()
  {    
    noStroke();
    fill(currentColor);
    rect(x + padding, y + padding, w-(padding*2), h-(padding*2), 10);
    
    fill(textColor);
    text(desc, (x+padding+40), (y+padding+60));
  }
}
class Slider
{
  int x;
  int y;
  int w;
  int h;
  int mainColor;
  int textColor;
  int currentColor;
  String desc;
  
  boolean justPressed;
  boolean justReleased;
  boolean isPressed;
  
  boolean lastPressed;
  boolean currPressed;
  
  int lastPressedPos;
  int currPressedPos;
  
  float currValue;
  float lastValue;
  float delta;
  
  int pressIndex;
  
  int padding = 20;
  
  public Slider(int x, int y, int w, int h, int mainColor, String desc)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.mainColor = mainColor;
    this.currentColor = mainColor;
    this.desc = desc;
    
    justPressed = false;
    justReleased = false;
    lastPressed = false;
    currPressed = false;
    isPressed = false;
    
    lastPressedPos = -1;
    currPressedPos = -1;
    
    currValue = 0;
    lastValue = 0;
    
    pressIndex = -1;
  }
  
  public boolean isInside(int x, int y)
  {
    if(x > this.x && x <= this.x + w &&
       y > this.y && y <= this.y + h)
       return true;
    
    return false;
  }
  
  public void update()
  {    
    lastPressed = currPressed;
    currPressed = false;
    
    justPressed = false;
    justReleased = false;
    
    currentColor = mainColor;
    textColor = color(255);
    
    for (int i = 0; i < touches.length; i++) {
      if(isInside((int)touches[i].x, (int)touches[i].y))
      {
        currPressed = true;
        currentColor = color(255, 255, 255);
        textColor = color(0);
        pressIndex = i;
        break;
      }
    }
    
    if(lastPressed && !currPressed)
    {
      justReleased = true;
      isPressed = false;
      pressIndex = -1;
      
      lastValue = 0;
      currValue = 0;
    }
      
    if(!lastPressed && currPressed)
    {
      justPressed = true;
      isPressed = true;
      
      currValue = (float)(currPressedPos - x) / (float)w;
      lastValue = currValue;
    }
      
    if(isPressed)
    {
      lastPressedPos = currPressedPos;
      currPressedPos = (int)touches[pressIndex].x;
      
      lastValue = currValue;
      currValue = (float)(currPressedPos - x) / (float)w;
      delta = lastValue - currValue;
    }
    
  }
  
  public float getValue()
  {
    return currValue *100;
  }
  
  public boolean justPressed()
  {
    return justPressed;
  }
  
  public boolean justReleased()
  {
    return justReleased;
  }
  
  public boolean isPressed()
  {
    return justReleased;
  }
  
  public void draw()
  {    
    fill(currentColor);
    rect(x + padding, y + padding, w-(padding*2), h-(padding*2), 10);
    
    fill(textColor);
    text(desc, (x+padding+40), (y+padding+60));
    
    if(isPressed)
    {
      fill(127);
      rect(currPressedPos-5, y+padding, 10, h-(padding*2));
    }
    fill(0);
  }
}
  public void settings() {  fullScreen(); }
}
