  public final int scl = 40;
  public Grid g = new Grid(800);
  public boolean hasRestarted = false;

void setup(){
  
  size(800,800);
  g.show();
}

public void restart(){
  g = new Grid(800);
  hasRestarted = true;
}

public int[] getCoordsMouse(){
  
  int[] coords = {mouseX/scl, mouseY/scl};
  
  return coords;

}

void draw(){
  
  if(hasRestarted){g.show(); delay(100);}

  if(mousePressed){
    
    if (mouseButton == LEFT) {
      int[] mouseCoords = getCoordsMouse();
      
      if(g.matrix[mouseCoords[0]][mouseCoords[1]].visible == false &&g.matrix[mouseCoords[0]][mouseCoords[1]].flagged==false){
        if(g.matrix[mouseCoords[0]][mouseCoords[1]].bomb == false){
      
          g.matrix[mouseCoords[0]][mouseCoords[1]].makeVisible();
          g.show();
        }else{
          fill(255,0,0);
          rect(mouseCoords[0]*scl, mouseCoords[1]*scl,scl,scl);
          restart();}  
      }
    }
  
  }
  
  if(mouseButton == RIGHT) {
    
      int[] mouseCoords = getCoordsMouse();
      
      g.matrix[mouseCoords[0]][mouseCoords[1]].flag();  
      g.show();
      
  }
  

} 
