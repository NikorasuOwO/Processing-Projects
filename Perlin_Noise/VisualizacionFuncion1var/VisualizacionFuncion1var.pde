float delta = 0;
int t = 0;
int i = 1;
float[] Ax = new float[width*10];
float[] Ay = new float[width*10];

static int scale = 1;

void setup(){

size(600,600);
background(255,250,240);
//println(width + " x " + height);
frameRate(400);


}

public static float fnsin(float x, float A, float B){

  return A*sin(B*x);
  
}

public static float fnmod(float x, float A, float B){

  return (float) (B*100*Math.tan(A*x+B));
  
}

public static float fnT(float x){

  return fnmod(x,16,0.04);
 // return fnsin(x,16,0.04) + fnsin(x,16,5) + fnmod(x,16,0.04)+ fnsin(x,16,5);
}

void draw(){
translate(0, width);

float y = height/2 + fnT(delta);

println("y est: " + y);

Ax[i] = delta;
Ay[i] = y;

Ax[i+1] = delta+1;
Ay[i+1] = fnT(Ax[i+1]);

fill(200,100,240);
rect(500,-578, 600,-600);


textSize(22);
fill(0,0,0);
text(y,width-100,-height+18);

fill(0,0,0);
//point(scale*delta, -y);

strokeWeight(2);
line(scale*Ax[i-1],-Ay[i-1],scale*Ax[i],-Ay[i]);


delta = delta + 1;
i++;

fill(100,100,203);
strokeWeight(0.1);
line(0,0,0,-height);
line(0, -height/2, width, -height/2);


if(scale*delta > width){delta = 0; i = 1;

println("\n···························\n");
for(int j = 0 ; j < Ax.length-1 ; j++){
  
  print(" " + Ax[j]);
  
  
}

println("\n···························");



noLoop();

}

}
