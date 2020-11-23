
public static int[] Coloration(float n){

  float ninv = 1-n;
  
  int r = round(n * 118);
  int g = round(n * 165);
  int b = round(n * 255);
  //int b = 220;

  if(n > 0.51){
  
  r = round(60 * ninv);
  g = round(255 * ninv);
  b = round(60 * ninv);
  
  }


int valor[] = {r,g,b};

return valor;
}
