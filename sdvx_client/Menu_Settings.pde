class Menu_Settings
{
  
  ControlP5 cp5;
  Textarea serverIP;
  controlP5.Button closeButton;
  Group menuGroup;
  Group ipGroup;
  public Menu_Settings(PApplet app)
  {
    cp5 = new ControlP5(app);
    InitControls();
    cp5.hide();
     
  }
  
  private void InitControls()
  {
    InitGraphics();
    InitCallBacks();
  }
  
  // Instanciate all graphical controls
  private void InitGraphics()
  {
    menuGroup = cp5.addGroup("g1")
                .setPosition(0,0)
                .setBackgroundHeight(0)
                .setSize(width, height)
                .setBackgroundColor(color(255,100));
                
    ipGroup =   cp5.addGroup("g1")
                .setPosition(0,0)
                .setBackgroundHeight(0)
                .setSize(width, height)
                .setBackgroundColor(color(255,100));
                    
    closeButton = cp5.addButton("CLOSE")
     .setValue(0)
     .setPosition(0,height - 200)
     .setSize(width, 200)
     .setFont(createFont("Teko-SemiBold.ttf", 90, true));
     
     cp5.addNumberbox("IP1")
     .setPosition(100,220)
     .setSize(400,400)
     .setFont(createFont("Teko-SemiBold.ttf", 90, true))
     .setRange(0,255)
     .setMultiplier(1) // set the sensitifity of the numberbox
     .setDirection(Controller.VERTICAL) // change the control direction to left/right
     .setValue(100);
     
     cp5.addNumberbox("IP2")
     .setPosition(100,220)
     .setSize(400,400)
     .setFont(createFont("Teko-SemiBold.ttf", 90, true))
     .setRange(0,255)
     .setMultiplier(1) // set the sensitifity of the numberbox
     .setDirection(Controller.VERTICAL) // change the control direction to left/right
     .setValue(100);
     
     cp5.addNumberbox("IP3")
     .setPosition(100,220)
     .setSize(400,400)
     .setFont(createFont("Teko-SemiBold.ttf", 90, true))
     .setRange(0,255)
     .setMultiplier(1) // set the sensitifity of the numberbox
     .setDirection(Controller.VERTICAL) // change the control direction to left/right
     .setValue(100);
     
     cp5.addNumberbox("IP4")
     .setPosition(100,220)
     .setSize(400,400)
     .setFont(createFont("Teko-SemiBold.ttf", 90, true))
     .setRange(0,255)
     .setMultiplier(1) // set the sensitifity of the numberbox
     .setDirection(Controller.VERTICAL) // change the control direction to left/right
     .setValue(100);
  }
  
  // Instanciate all controls callbacks
  private void InitCallBacks()
  {
    closeButton.addCallback(new CallbackListener() {
          public void controlEvent(CallbackEvent theEvent) 
          {
            // Workaround for the first call
            if(theEvent.getAction() == ControlP5.ACTION_ENTER || theEvent.getAction() == ControlP5.PRESSED)
              hideSettingsMenu();
          }
        }
      );
  }
  
  public void openSettingsMenu()
  {
    menuOpened = true;
    cp5.show();
  }
  
  public void hideSettingsMenu()
  {
    cp5.hide();
    menuOpened = false;
    println("CLOSING MENU");
  }
}
