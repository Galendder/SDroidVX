public enum ModifiedField
{
  IP,
  PORT,
  NONE
}

class Menu_Settings
{
  
  ControlP5 cp5;
  
  Textlabel serverIPLabel;
  Textlabel serverIPField;
  Textlabel serverPortLabel;
  Textlabel serverPortField;
  
  controlP5.Button closeButton;
  controlP5.Button changeIpButton;
  controlP5.Button changePortButton;
  
  ColorPickerEX buttonColorPicker;
  
  Group menuGroup;
  Group ipGroup;
  
  public ModifiedField modifiedField = ModifiedField.NONE;
  
  int fontMenuSize = 70;
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
                
    ipGroup =   cp5.addGroup("ipGroup")
                .setPosition(0,0)
                .setBackgroundHeight(2)
                .setSize(width, height / 4)
                .setBackgroundColor(color(155, 0, 155, 100));
                    
    closeButton = cp5.addButton("SAVE AND CLOSE")
     .setValue(0)
     .setPosition(0,height - 200)
     .setSize(width, 200)
     .setFont(createFont("Teko-SemiBold.ttf", 80, true));
     
     buttonColorPicker = new ColorPickerEX(cp5, "BTNCOLORPICKER");
     buttonColorPicker
     .setSize(800, 800)
     .setBarHeight(200)
     .setFont(createFont("Teko-SemiBold.ttf", 80, true))
     .setPosition(0, height / 4)
     .setValue(mainBtnColor);
     buttonColorPicker.setItemSize(400,100);
     
     
    InitIpConfig();
     
  }
  
  private void InitIpConfig()
  {
    // IP
    serverIPLabel = cp5.addTextlabel("IP")
                .setText("IP :") 
                .setPosition(0, 30)
                .setSize(width / 40, height / 4)
                .setFont(createFont("Teko-SemiBold.ttf", 60, true))
                .setGroup("ipGroup");
     
    serverIPField = cp5.addTextlabel("SERVERLABEL")
                .setText(serverIP)
                .setPosition(serverIPLabel.getWidth() + 30, 30)
                .setColorBackground(color(155, 0, 155, 150))
                .setSize(width / 4, height / 4)
                .setFont(createFont("Teko-SemiBold.ttf", 60, true))
                .setGroup("ipGroup");
        
    changeIpButton = cp5.addButton("CHANGE IP")
     .setPosition(serverIPLabel.getWidth() + serverIPLabel.getWidth() + 150, 20)
     .setSize(width / 8, height / 15)
     .setFont(createFont("Teko-SemiBold.ttf", 60, true))
     .setGroup("ipGroup");
     
     
    // PORT
    serverPortLabel = cp5.addTextlabel("PORT")
                .setText("PORT :") 
                .setPosition(0, 170)
                .setSize(width / 40, height / 4)
                .setFont(createFont("Teko-SemiBold.ttf", 60, true))
                .setGroup("ipGroup");
     
    serverPortField = cp5.addTextlabel("PORTLABEL")
                .setText(serverPort)
                .setPosition(serverPortLabel.getWidth() + 30, 170)
                .setColorBackground(color(155, 0, 155, 150))
                .setSize(width / 4, height / 4)
                .setFont(createFont("Teko-SemiBold.ttf", 60, true))
                .setGroup("ipGroup");
                
      changePortButton = cp5.addButton("CHANGE PORT")
       .setPosition(serverPortLabel.getWidth() + serverPortField.getWidth() + 150, 160)
       .setSize(width / 8, height / 15)
       .setFont(createFont("Teko-SemiBold.ttf", 60, true))
       .setGroup("ipGroup");
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
      
     changeIpButton.addCallback(new CallbackListener() {
          public void controlEvent(CallbackEvent theEvent) 
          {
            // Workaround for the first call
            if(theEvent.getAction() == ControlP5.ACTION_ENTER || theEvent.getAction() == ControlP5.PRESSED)
            {
              modifiedField = ModifiedField.PORT;
              openIpConfigKeyboard();
            }

          }
        }
      );
      
     changePortButton.addCallback(new CallbackListener() {
          public void controlEvent(CallbackEvent theEvent) 
          {
            // Workaround for the first call
            if(theEvent.getAction() == ControlP5.ACTION_ENTER || theEvent.getAction() == ControlP5.PRESSED)
            {
              modifiedField = ModifiedField.PORT;
              openIpConfigKeyboard();
            }
          }
        }
      );
    
  }
  
  private void openIpConfigKeyboard()
  {
    openKeyboard();
  }
  
  public void openSettingsMenu()
  {
    menuOpened = true;
    cp5.show();
  }
  
  public void hideSettingsMenu()
  {
    mainBtnColor = buttonColorPicker.getChoosenColor();
    configButtons();
    cp5.hide();
    menuOpened = false;
    
    println("CLOSING MENU");
  }
  
    
  public void refreshConfigField()
  {
    menu.serverIPField.setText(serverIP);
    menu.serverIPField.draw();
    menu.serverPortField.setText(serverPort);
    menu.serverPortField.draw();
  }
  
}
