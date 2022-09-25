public class Node{
  private boolean state = true;
  private color colored = color(255,255,255);
  private ArrayList<Node> nb;
  
  public String info = "-";
  
    private int x, y;
  
  public Node(boolean state){
    this.state=state;
  }
  
  public Node(boolean state, int x, int y){
    this.state=state;
    this.x = x;
    this.y = y;
  }

  public String toString(){
    return info;
  }
  
  public boolean equals(Node node){return (this.x == node.x) && (this.y == node.y);}
  
  public int getX(){return this.x;}
  public int getY(){return this.y;}
  
  public boolean getState(){return this.state;}
  public void setState(boolean state){
    
    //We also need to let the neighboors know about the change!
    if(state){
      for(Node n:this.nb){
        if (!n.getNb().contains(this)) n.addNb(this);
      }
    }else{
      for(Node n:this.nb) n.removeNb(this);
    }
    this.state=state;
}
  
  public color getColor(){return this.colored;}
  public void setColor(color c){this.colored=c;}
  public void setColor(int a, int b, int c){this.colored=color(a,b,c);}
  
  public void reset(){
    this.setColor(color(255,255,255));
    this.setState(true);
  }
  
  public ArrayList<Node> getNb(){return this.nb;}
  public void setNb(ArrayList<Node> nb){this.nb=nb;}
  public void addNb(Node n){this.nb.add(n);}
  public void removeNb(Node n){this.nb.remove(n);}
  
  public void updateOnScreen(){
    strokeWeight(2);
    rectMode(CENTER);
    if(this.getState()){
      noStroke();
      fill(200);
      rect((0.05*W+x*0.025*W)*(40/n),(0.05*H+y*0.025*H)*(40/n), (0.025*W)*(40/n), (0.025*H)*(40/n));
      
      stroke(10);
      fill(this.getColor());
      circle((0.05*W+x*0.025*W)*(40/n),(0.05*H+y*0.025*H)*(40/n), (0.025*W)*(40/n));
      fill(0);
      textSize(17);
      text(this.toString(), (0.05*W+x*0.025*W)*(40/n) - (0.025*W*1.4), (0.05*H+y*0.025*H)*(40/n) + (0.025*H*0.5));
    }else{
      fill(0,0,0);
      noStroke();
      rect((0.05*W+x*0.025*W)*(40/n),(0.05*H+y*0.025*H)*(40/n), (0.025*W)*(40/n), (0.025*H)*(40/n));
      
    }
  }
  
  
  
}
