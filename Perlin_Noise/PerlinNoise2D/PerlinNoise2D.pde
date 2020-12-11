


void setup(){


  size(800,800);

  background(220,220,220);
 // noiseSeed(2);
  frameRate(1);
  
}

int scl = 1;
float xoff = 0;
float yoff = 0;
float nv;
int r,g,b;

double globalmat [][] = new double[height/scl][width/scl];
int indexi = 0;
int indexj = 0;


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
      text(nv*10,x,y); */
      
     /* if( ){
      globalmat[indexi][indexj] = Math.floor(nv*100)/100.0;
      print(globalmat[indexi][indexj] + " " + "i:" + indexi + " j:" + indexj + "  "); 
    
  }*/
      
      xoff += 0.01;
      indexi++;
    }
    yoff+= 0.01;
    indexi = 0;
    indexj++;
    println("");
  }

noLoop();
}
