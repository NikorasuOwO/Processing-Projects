void setup(){

  background(200,200,220);
  size(800,800);
  
}

Particle Punto1 = new Particle(0,0,10,0);

void draw(){
  
  translate(width/2, height/2);
  Punto1.Movement();
  Punto1.Show();
}
