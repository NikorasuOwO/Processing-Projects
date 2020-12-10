void setup(){

  size(800,800);
  background(220,220,200);
  
}

int d = 80;
float noise = noise(0.1);
float r,g,b;

void draw(){
  for(int j = 0; j < width/d ; j++){
  for(int i = 0; i < width/d ; i++){
    
    r = 200+random(0,75)*noise;
    g = 200+random(0,75)*noise;
    b = 200+random(0,75)*noise;
    
    println(r);
    
    fill(r,g,b);
    rect(i*d,j*d,d,d);
  
  }}

noLoop();
}
