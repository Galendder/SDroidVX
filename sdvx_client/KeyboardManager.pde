// Not a class, only handling keyboard events to bypass ControlP5 flaws

void keyPressed()
{
  // There is probably a way to refactorize this to avoid code paste, but I'm tired, don't judge me.
  if (key != BACKSPACE && key != ENTER)
  {
    if (menu.modifiedField == ModifiedField.IP)
      serverIP += key;
    if (menu.modifiedField == ModifiedField.PORT)
      serverPort += key;
  }
  if (keyCode == 67)
  {
    if (menu.modifiedField == ModifiedField.IP && serverIP.length() > 0)
      serverIP = serverIP.substring(0, serverIP.length() - 2);
    if (menu.modifiedField == ModifiedField.PORT && serverPort.length() > 0)
      serverPort = serverPort.substring(0, serverPort.length() - 2);
  }
  if (keyCode == 66)
  {
    closeKeyboard();
  }
  menu.refreshConfigField();
  // Right now the only reason to open the keyboard is to update the IP or the port. We need to refresh those controls.

}
