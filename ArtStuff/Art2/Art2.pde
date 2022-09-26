void setup(){

  size(800,800);
  background(220,220,200);
  
}

float r = random(0,255);
float g = random(0,255);
float b = random(0,255);
float i = 3;

int d = 80;
float noise = noise(0.1);


void draw(){
    
    noStroke();
    fill(r,g,b);
 //   rect(0,0,width,height);
    
    rect(random(-50,width),random(-50,width),width/random(4,12),height/random(4,12));
    rect(random(-50,width),random(-50,width),width/random(4,12),height/random(4,12));
    
   r = r + i;
   g = g + i;
   b = b + i;
   
   println("r: " + r, " g: " + g , " b: " + b); 
    
   if (r >= 255 || r <= 0){ i = i * -1; r = random(100,155); }
   if (g >= 255 || r <= 0){ i = i * -1; g = random(100,155); }
   if (b >= 255 || r <= 0){ i = i * -1; b = random(100,155); }

}
