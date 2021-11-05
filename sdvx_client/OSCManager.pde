class OSCManager
{
  void sendOscMessages()
  {
    // Dispatch OSC messages for each of the buttons pressed.
    sendPressEvents();
    sendReleaseEvents();
    sendSliderEvents();
  }
  
  private void sendPressEvents()
  {
    if(btn_a.justPressed())
    {
      OscMessage msg = new OscMessage("/btn-a");
      msg.add("P");
      oscP5.send(msg, serverAddress);
    }
    
    if(btn_b.justPressed())
    {
      OscMessage msg = new OscMessage("/btn-b");
      msg.add("P");
      oscP5.send(msg, serverAddress);
    }
    
    if(btn_c.justPressed())
    {
      OscMessage msg = new OscMessage("/btn-c");
      msg.add("P");
      oscP5.send(msg, serverAddress);
    }
    
    if(btn_d.justPressed())
    {
      OscMessage msg = new OscMessage("/btn-d");
      msg.add("P");
      oscP5.send(msg, serverAddress);
    }
    
    if(fx_l.justPressed())
    {
      OscMessage msg = new OscMessage("/fx-l");
      msg.add("P");
      oscP5.send(msg, serverAddress);
    }
    
    if(fx_r.justPressed())
    {
      OscMessage msg = new OscMessage("/fx-r");
      msg.add("P");
      oscP5.send(msg, serverAddress);
    }
     
    if(start.justPressed())
    {
      OscMessage msg = new OscMessage("/start");
      msg.add("P");
      oscP5.send(msg, serverAddress);
    }
  }
  
  private void sendReleaseEvents()
  {
    if(btn_a.justReleased())
    {
      OscMessage msg = new OscMessage("/btn-a");
      msg.add("R");
      oscP5.send(msg, serverAddress);
    }
    
    if(btn_b.justReleased())
    {
      OscMessage msg = new OscMessage("/btn-b");
      msg.add("R");
      oscP5.send(msg, serverAddress);
    }
    
    if(btn_c.justReleased())
    {
      OscMessage msg = new OscMessage("/btn-c");
      msg.add("R");
      oscP5.send(msg, serverAddress);
    }
    
    if(btn_d.justReleased())
    {
      OscMessage msg = new OscMessage("/btn-d");
      msg.add("R");
      oscP5.send(msg, serverAddress);
    }
    
    if(fx_l.justReleased())
    {
      OscMessage msg = new OscMessage("/fx-l");
      msg.add("R");
      oscP5.send(msg, serverAddress);
    }
    
    if(fx_r.justReleased())
    {
      OscMessage msg = new OscMessage("/fx-r");
      msg.add("R");
      oscP5.send(msg, serverAddress);
    }
    
    if(start.justReleased())
    {
      OscMessage msg = new OscMessage("/start");
      msg.add("R");
      oscP5.send(msg, serverAddress);
    }
  }
  
  private void sendSliderEvents()
  {
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
}
