class Button
{
  int x;
  int y;
  int w;
  int h;
  color mainColor;
  color textColor;
  color currentColor;
  String desc;
  
  boolean justPressed;
  boolean justReleased;
  
  boolean lastPressed;
  boolean currPressed;
  int timePressed;
  
  int padding = 20;
  
  public Button(int x, int y, int w, int h, color mainColor, String desc)
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
    if (!menuOpened)
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
      {
        justReleased = true;
        timePressed = 0;
      }
  
        
      if(!lastPressed && currPressed)
      {
        justPressed = true;
        timePressed = millis();
      }
    }
  }
  
  public boolean justPressed()
  {
    return justPressed;
  }
  
  public boolean justReleased()
  {
    return justReleased;
  }

  public boolean pressedMoreThanFiveSeconds()
  {
    return millis() - timePressed > 5000 && timePressed != 0;
  }
  
  public void resetTimer()
  {
    timePressed = 0;
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
