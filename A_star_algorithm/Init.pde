
// CONSTANTS
  int n = 10;
  NodesGrid g = new NodesGrid(n,n);
  int W = 600; // width/2
  int H = 600; // height*(2/3)
  int MARGIN = 100;
  
  public Node START = g.getNode(0,0);
  public Node G = g.getNode(n-1,n-1);
  
  boolean hasStarted = false;
  
public void setup(){
  
  size(1200,900);
  background(200,200,200);
  
  START.setColor(color(100,100,250)); // START NODE
  G.setColor(color(0,200,20)); // GOAL NODE
  
  /*WALLS (state=False)
  for(int i=n/2; i< (n/2) + (n/4); i++){
    g.getNode(i,n/2).setState(false);
    g.getNode(n/2,i).setState(false);
  }*/
  
  /* GRID SETUP (SPECIFIC)
  Node MyNode = g.getNode(1+ (n/2),1+ (n/2));
  MyNode.setColor(255,80, 80);
  for(Node node:MyNode.getNb()){
    //node.setColor(200,200,255);
  }
  println("MyNode is"+MyNode);
  println(MyNode.getNb(), MyNode.getNb().size());*/
  
  
  g.show(W, H, MARGIN);
  
}

public void drawPath(ArrayList<Item> list){
  
  //(0.05*W+x*0.025*W)*(40/n)
  int x = round((0.05*W+START.getX()*0.025*W)*(40/n));
  int y = round((0.05*H+START.getY()*0.025*H)*(40/n));
  
  int currentX, currentY;
  
  for(Item item:list){
    
    currentX = round((0.05*W+item.node.getX()*0.025*W)*(40/n));
    currentY = round((0.05*H+item.node.getY()*0.025*H)*(40/n));
    
    stroke(0, 255, 0);
    strokeWeight(20);
    line(x,y,currentX, currentY);
    strokeWeight(4);
    stroke(20);
    
    x = currentX;
    y = currentY;
    
  }
  
  for(Item item:list){
    item.node.setColor(0,255,40);
    item.node.updateOnScreen();
  }
}

public void printPath(ArrayList<Item> list){
    for(Item item:list){
      println(String.format("%s [<= %s]", item.node, item.parent.node ));
      println(String.format("h: %f, g: %d", item.h, item.g));
      println(String.format("NBs: %s", item.node.getNb()));
      println();
    }
}


public void keyPressed(){
  
  if(key == 'c'){
    g.clear();
    g.show(W, H, MARGIN);
    hasStarted = false;
    START.setColor(0,0,255); START.updateOnScreen();
    G.setColor(0,255,0); G.updateOnScreen();
  }
  if(key == 'r'){
    g.reset();
    g.show(W, H, MARGIN);
    hasStarted = false;
    START.setColor(0,0,255); START.updateOnScreen();
    G.setColor(0,255,0); G.updateOnScreen();
  }
  if(key == 'a' && !hasStarted){
    hasStarted = true;
    ArrayList<Item> FINAL_PATH = A_star();
    drawPath(FINAL_PATH);
    START.setColor(0,0,255); START.updateOnScreen();
    G.setColor(0,0,255); G.updateOnScreen();
    hasStarted = false;
    printPath(FINAL_PATH);
  }
}

public void mouseClicked(){
  
  //finds Node on the screen
  int xCoord = Math.round( (mouseX/((0.025*W)*(40/n))) - 2);
  int yCoord = Math.round( (mouseY/((0.025*H)*(40/n))) - 2);
  
  //println(String.format("(%d, %d)", xCoord, yCoord));
  
  //UPDATING NODE
  if (!(xCoord < 0 || xCoord > n || yCoord < 0 || yCoord > n)){
    Node node = g.getNode(xCoord, yCoord);
    boolean before  = node.getState();
    node.setState(!node.getState()); node.updateOnScreen();
    println(String.format("UPDATED NODE %s, NBs: %s.\nBefore %b, now %b", node, node.getNb(), before, node.getState()));
  }

  
}

public void draw(){}
