void setup(){

  size(1280,720,P3D);
  background(220,220,220);
 // noiseSeed(2);
  frameRate(60);
  
}

float scl = 2;
float xoff = 0;
float yoff = 0;
float nv; 

void draw(){
//translate(-width/2, height/2);
  
  
  for(float y = 0; y < height ; y = y + scl){
    xoff = 0;
    for(float x = 0; x < width ; x = x + scl){
      
      nv = fnT(xoff,yoff);
      
      noStroke();
      fill(nv*255,nv*255,nv*255);
      rect(x,y,scl,scl);
      
      /*fill(255,108,240); 
      textSize(12);
      text(nv*10,x,y);*/
      
      xoff += 0.01;
    }
    yoff+= 0.01;  
  }



println(yoff);

}
