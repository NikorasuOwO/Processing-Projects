void setup(){
  
  size(1920,1080);
  background(220,240,230);
  frameRate(420);
}

boolean mode = true;
int r = 100;
int g = 100;
int b = 100;
float i = 0;
int flip = 1;
int flipvalue = 70;
int counter = 1;

void draw(){

fill(r,g,b);

if(mousePressed){
  
  mode = !mode;
  r = (int) random(100,250);
  g = (int) random(100,250);
  b = (int) random(100,250);
  
}
  rect(pmouseX-0.5, pmouseY-0.5,2*i,2*i);
  //rect(mouseX, mouseY,2*i,2*i);
  ellipse(mouseX, mouseY,2*i,2*i);
  triangle(mouseX,mouseY, mouseX - 2*i, mouseY - 2*i, mouseX - 2*i, mouseY);
  
 println(i);

if(i > flipvalue || i < 0){
  mode = !mode;
  flip = -flip;

  r = (int) random(100,250);
  g = (int) random(100,250);
  b = (int) random(100,250);

flipvalue = (int) random(50,90);
counter++;

}

i = i + 0.5*flip;

if (keyPressed) {
    if (key == 'p' || key == 'P') {
      saveFrame("1080p"+counter);
    } 
  
   
}

}
