


void setup(){

  size(600,600,P3D);
  background(220,220,220);
  
}

int scale = 20;
int h = 16000;
int w = 16000;
int cols = w/scale;
int rows = h/scale;


void draw(){
  
  translate(width/2,height/2);
  rotateX(PI/3);
  translate(-width/2,-height/2);

  
  
  println(rows);
  stroke(0,0,0);
  background(220,200,200);
  
  
  for(int y = 0; y < rows; y++){
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++){
      
      vertex(x*scale, y*scale, 100*noise(x,y) , scale,scale);
      vertex(x*scale, (y+1)*scale, 100*noise(x,y), scale,scale);
      
    }
    
  endShape();

  }
  
  noLoop();


}
