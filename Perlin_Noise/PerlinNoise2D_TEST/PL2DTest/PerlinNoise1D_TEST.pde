float delta = 0;
int t = 0;
int i = 1;
float[] Ax = new float[width*10];
float[] Ay = new float[width*10];

static int scale = 1;

public static float fnsin(float x, float y, float A, float B){

  return A*sin(B*(x+y));
  
}

public static float fnmod(float x, float y, float A, float B){

  return (float) (B*100*y*Math.tan(A*x+B));
  
}

public static float fnT(float x, float y){

  return fnsin(x, y,1,0.004);
 // return fnsin(x, y, 16,0.04) + fnsin(x,y,16,5) + fnmod(x,y,16,0.04)+ fnsin(x,y,16,5);
}
