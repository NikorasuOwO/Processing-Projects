void setup(){

  size(1920,1080);
  background(220,220,200);
  
}

int d = 160;
float noise = noise(0.1);
float r,g,b;
int i = 0;

void draw(){
  
  
  for(int j = 0; j < width/d ; j++){
  for(int i = 0; i < width/d ; i++){
    
    r = 200+random(0,55)*noise;
    g = 200+random(100,155)*noise;
    b = 200+random(100,155)*noise;
    
    println(r);
    
    noStroke();
    fill(r,g,b);
    rect(i*d,j*d,d,d);
  
  }}

  saveFrame("Img6.png");


noLoop();

i++;

}
