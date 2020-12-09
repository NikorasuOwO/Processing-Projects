


void setup(){

  size(1280,720);
  background(220,220,220);
 // noiseSeed(2);
  frameRate(400);
  
}

float scl = 10;
float xoff = 0;
float yoff = 0;
float nv; 

void draw(){
  
  for(float y = 0; y < height ; y = y + scl){
    xoff = 0;
    for(float x = 0; x < width ; x = x + scl){
      
      nv = fnT(xoff,yoff);
      
      stroke(255,113,231);
      fill(nv*255,nv*255,nv*255);
      rect(x,y,scl,scl);
      
      /*fill(255,108,240); 
      textSize(12);
      text(nv*10,x,y);*/
      
      xoff += 0.01;
    }
    yoff+= 0.01;  
  }


//noLoop();

println(yoff);

/*if(yoff > 5){

  scl = scl + 0.2;
  
}*/

}
