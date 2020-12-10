
public static int[] Coloration(float n){

  float ninv = 1-n;
  
  int r = round(n * 118);
  int g = round(n * 165);
  int b = round(n * 255);
  //int b = 220;

  if(n > 0.45){
  
  r = round(70 * ninv);
  g = round(255 * ninv);
  b = round(70 * ninv);
  
  }
  
  if ((n > 0.45) && (n <= 0.50)){
  
    r = 245;
    g = 216;
    b = 119;
    
  
  }
  
  if (n > 0.67){
  
    r = round(170 * ninv*2);
    g = round(100 * ninv*2);
    b = round(2 * ninv*2);
  
  }


int valor[] = {r,g,b};

return valor;
}
