float delta = 0.01;
int t = 0;
int i = 0;

float ColorR = random(130,220);
float ColorG = random(130,220);
float ColorB = random(130,220);

void setup(){

size(600,600);
background(255,250,240);
println(width + " x " + height);


}

void draw(){
  translate(0, 599);
  
  
float x = map(noise(delta),0,1,0,height/2);

fill(ColorR,ColorG,ColorB);
rect(300,-width/2 -40,160,50,9);

textSize(32);
fill(255,250,240);
text(x,300,-width/2);

stroke(ColorR,ColorG,ColorB);
line(t,0,t,-x);

delta = delta + 0.01;

t = t +2;

if (t == width){
  i = 0;
  t = 0;
  
 ColorR = random(30,195);
 ColorG = random(30,195);
 ColorB = random(30,195);

  while (ColorR+ColorB+ColorG < 420){
  
    if(max(ColorR,ColorB,ColorG) == ColorR){ColorR = ColorR*1.8;}
    if(max(ColorR,ColorB,ColorG) == ColorG){ColorG = ColorG*1.8;}
    if(max(ColorR,ColorB,ColorG) == ColorB){ColorB = ColorB*1.8;}
    i++;
  }

println(ColorR + " " + ColorG + " " + ColorB + "i: " +i);

background(255,250,240);
  
}
}
