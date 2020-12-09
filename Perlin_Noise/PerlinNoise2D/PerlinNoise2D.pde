


void setup(){

  size(800,800);
  background(220,220,220);
  //noiseSeed(10);
  //frameRate();
  
}

int scl = 1;
float xoff = 0;
float yoff = 0;
float nv;
int r,g,b;

void draw(){
  
  for(int y = 0; y < height ; y = y + scl){
    xoff = 0;
    for(int x = 0; x < width ; x = x + scl){
      
      nv = noise(xoff,yoff);
      
      int [] colorvect = Coloration(nv);
      
      r = colorvect[0];
      g = colorvect[1];
      b = colorvect[2];
      
      noStroke();
      fill(r,g,b);
      rect(x,y,scl,scl);
      
      /*fill(255,108,240); 
      textSize(12);
      text(nv*10,x,y);*/
      
      xoff += 0.01;
    }
    yoff+= 0.01;  
  }


noLoop();
}
