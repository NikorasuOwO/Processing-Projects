
public static int[] Coloration(float n){

  
  int r = round(n * 118);
  int g = round(n * 165);
  int b = round(n * 255);
  //int b = 220;

  if(n > 0.51){
  
  r = 50;
  g = 205;
  b = 50;
  
  }


int valor[] = {r,g,b};

return valor;
}
