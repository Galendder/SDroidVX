// Workaround found here to increase ColorPicker size https://forum.processing.org/one/topic/controlp5-color-picker-won-t-resize.html
class ColorPickerEX extends controlP5.ColorPicker {
  ColorPickerEX(ControlP5 cp5, String theName) {
    super(cp5, cp5.getTab("default"), theName, 0, 0, 100, 10);
  }
 
  void setItemSize(int w, int h) {
    sliderRed.setSize(w, h);
    sliderGreen.setSize(w, h);
    sliderBlue.setSize(w, h);
    sliderAlpha.setSize(w, h);
   
    //// you gotta move the sliders as well or they will overlap
    sliderGreen.setPosition(sliderGreen.getAbsolutePosition()[0], sliderGreen.getAbsolutePosition()[1] + h);
    sliderBlue.setPosition(sliderBlue.getAbsolutePosition()[0], sliderBlue.getAbsolutePosition()[1] + (h*2));
    sliderAlpha.setPosition(sliderAlpha.getAbsolutePosition()[0], sliderAlpha.getAbsolutePosition()[1] + (h*3));
  }
  
  color getChoosenColor()
  {
    int r = int(this.getArrayValue(0));
    int g = int(this.getArrayValue(1));
    int b = int(this.getArrayValue(2));
    int a = int(this.getArrayValue(3));
    return color(r,g,b,a);
  }
}
