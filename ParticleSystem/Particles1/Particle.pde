public class Particle {
  
  private int x,y;
  private float v;
  private float a;

  Particle(int x, int y, float v, float a){
    
    this.x = x;
    this.y = y;
    this.v = v;
    this.a = a;
    
  }
  
  public void Movement(){
    
    this.x = round(this.x + this.v);
    this.y = round(this.y + this.v);
    println(round(this.x + this.v));
  }
  
  public void Show(){
    
    ellipse(this.x, this.y,10,10);
  
  }
  
  
  
  
}
