class Button{

  String label;
  float posX, posY, w, h;
  color btnColor;
  
  Button(String ilabel, color icolor, float iposX, float iposY, float iw, float ih){
    label = ilabel;
    btnColor = icolor;
    posX = iposX;
    posY = iposY;
    w = iw;
    h = ih;
  }
  
  void display(){
    push();
    // Draw bounding box
    stroke(76);
    fill(btnColor);
    rect(posX,posY,w,h);
    
    //Draw label
    textSize(20);
    textAlign(CENTER, CENTER);
    fill(255);
    text(label, posX+(w/2.0), posY+(h/2.0));
    
    pop();
  }
  
  boolean MouseIsOver(){
    return (mouseX > posX && mouseX < posX + w && mouseY > posY && mouseY < posY + h);
  }
  
  void setColor(color icolor){
    btnColor = icolor;
  }
  
  void setX(int x){
    posX = x;
  }
  
  void setY(int y){
    posY = y;
  }
}
