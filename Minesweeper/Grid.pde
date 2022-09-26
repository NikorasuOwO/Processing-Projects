class Grid{
  
  public Cell[][] matrix;


  Grid(int wh){  
    matrix = new Cell[wh/scl][wh/scl];
    for(int j = 0; j < matrix.length; j++){
        for(int i = 0; i < matrix.length; i++){
          matrix[i][j] = new Cell();
          matrix[i][j].x = i;
          matrix[i][j].y = j;
          int a = (int) random(1, 480);
          if(a <= 99){
            matrix[i][j].bomb = true;
          }
        }
    }
    
    for(int j = 0; j < matrix.length; j++){
      for(int i = 0; i < matrix.length; i++){
          byte counter = 0;
          try{
            if(matrix[i-1][j-1].bomb == true){
              counter++;
            }}catch (Exception e) {}
          try{
            if(matrix[i+1][j-1].bomb == true){
              counter++;
            }}catch (Exception e) {}
          try{
            if(matrix[i][j-1].bomb == true){
              counter++;
            }}catch (Exception e) {}
          try{
            if(matrix[i-1][j+1].bomb == true){
              counter++;
            }}catch (Exception e) {}
          try{
            if(matrix[i+1][j+1].bomb == true){
              counter++;
            }}catch (Exception e) {}
          try{
            if(matrix[i][j+1].bomb == true){
              counter++;
            }}catch (Exception e) {}
          try{
            if(matrix[i+1][j].bomb == true){
              counter++;
            }}catch (Exception e) {}
          try{
            if(matrix[i-1][j].bomb == true){
              counter++;
            }}catch (Exception e) {}
            matrix[i][j].adj = counter;
      
      }
    }
    
  }
  
  public void revealNeighbors(int x,int y){

    try{
      if(matrix[x-1][y-1].bomb == false /*&& matrix[x-1][y-1].adj == 0*/ && matrix[x-1][y-1].visible==false){
        matrix[x-1][y-1].makeVisible();
      }}catch (Exception e) {}
    try{
      if(matrix[x+1][y-1].bomb == false /*&& matrix[x+1][y-1].adj == 0*/ && matrix[x+1][y-1].visible==false){
        matrix[x+1][y-1].makeVisible();
      }}catch (Exception e) {}
    try{
      if(matrix[x][y-1].bomb == false /*&& matrix[x][y-1].adj == 0*/ && matrix[x][y-1].visible==false){
        matrix[x][y-1].makeVisible();
      }}catch (Exception e) {}
    try{
      if(matrix[x-1][y+1].bomb == false /*&& matrix[x-1][y+1].adj == 0*/ && matrix[x-1][y+1].visible==false){
        matrix[x-1][y+1].makeVisible();
      }}catch (Exception e) {}
    try{
      if(matrix[x+1][y+1].bomb == false /*&& matrix[x+1][y+1].adj == 0*/ && matrix[x+1][y+1].visible==false){
        matrix[x+1][y+1].makeVisible();
      }}catch (Exception e) {}
    try{
      if(matrix[x][y+1].bomb == false /*&& matrix[x][y+1].adj == 0*/ && matrix[x][y+1].visible==false){
        matrix[x][y+1].makeVisible();
      }}catch (Exception e) {}
    try{
      if(matrix[x+1][y].bomb == false /*&& matrix[x+1][y].adj == 0*/ && matrix[x+1][y].visible==false){
        matrix[x+1][y].makeVisible();
      }}catch (Exception e) {}
    try{
      if(matrix[x-1][y].bomb == false /*&& matrix[x-1][y].adj == 0*/ && matrix[x-1][y].visible==false){
        matrix[x-1][y].makeVisible();
      }}catch (Exception e) {}


  }
  
  public void show(){
    
    //print("{{" + this.matrix.length + "}}");
   /* 
    for(int j = 0; j < matrix.length; j++){
        println();
        for(int i = 0; i < matrix.length; i++){
          print(matrix[i][j].adj);
      
      }
  }*/
  
    fill(220,220,220);
    for(int j = 0; j < matrix.length; j++){
      for(int i = 0 ; i < matrix.length ; i++){
        
        if(matrix[i][j].visible == false){
          fill(220,220,220);
          rect(i*scl, j*scl, scl, scl);
          
          if(matrix[i][j].flagged == true){
            println("lol tri");
            triangle(matrix[i][j].x*scl+scl/2, matrix[i][j].y*scl, matrix[i][j].x*scl, (matrix[i][j].y+1)*scl, (matrix[i][j].x+1)*scl, (matrix[i][j].y+1)*scl);}
          
        }else{
          
          if(matrix[i][j].adj != 0 || matrix[i][j].bomb==true){
            fill(220,220,220);
            rect(i*scl, j*scl, scl, scl);
          }else{
            fill(230,255,230);
            rect(i*scl, j*scl, scl, scl);
          }
          fill(255,0,255);
          if(matrix[i][j].adj != 0 && matrix[i][j].bomb == false){
            textSize(20);
            textAlign(CENTER);
            text(matrix[i][j].adj,i*scl+scl/2, j*scl+scl-scl/3);
            }
          if(matrix[i][j].bomb == true){
            textSize(25);
            fill(0);
            text(/*matrix[i][j].bomb*/ "|#|" ,i*scl+scl/2, j*scl+scl-scl/2+10);
            
          }
            }
      }
    }
  }
  }
