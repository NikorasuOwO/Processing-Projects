


void setup(){

  size(600,600,P3D);
  background(220,220,220);
  
}

int scale = 20;
int h = 600;
int w = 600;
int cols = w/scale;
int rows = h/scale;

void draw(){
  
  println(rows);
  
  background(220,200,200);
  
  for(int y = 0; y < rows+1; y++){
    
    for (int x = 0; x < cols; x++){
      
      rect(x*scale, y*scale, scale,scale);
      
    }
  }


}
