public class NodesGrid{
  
  int sizeW, sizeH;
  Node[][] grid;
  boolean on_screen = false;
  
  public NodesGrid(int sizeW, int sizeH){
    this.sizeW = sizeW;
    this.sizeH = sizeH;
    this.grid = new Node[sizeW][sizeH];
    
    //Creating the nodes
    for(int i=0; i < sizeW; i++){
      for(int j=0; j<sizeH; j++){
        this.grid[i][j]= new Node(true, i, j);
        this.grid[i][j].info = String.format("N(%d, %d)",i, j);
      }
    }
    
    //Connecting the nodes
    for(int i=0; i < sizeW; i++){
      for(int j=0; j<sizeH; j++){
        
        ArrayList<Node> list = new ArrayList<>(3);
        
        if(i>0 && j>0) list.add(this.grid[i-1][j-1]);
        if(j>0) list.add(this.grid[i][j-1]);
        if(i<sizeW-1 && j>0) list.add(this.grid[i+1][j-1]);
        
        if(i>0) list.add(this.grid[i-1][j]);
        if(i<sizeW-1) list.add(this.grid[i+1][j]);
        
        if(i>0 && j<sizeH-1) list.add(this.grid[i-1][j+1]);
        if(j<sizeH-1) list.add(this.grid[i][j+1]);
        if(i<sizeW-1 && j<sizeH-1) list.add(this.grid[i+1][j+1]);
        
        this.grid[i][j].setNb(list);
      }
    }
    
  }
  
  public Node getNode(int x, int y){
    if(x<sizeW && y<sizeH && x >= 0 && y >= 0){
      return this.grid[x][y];
    }
    return null;
  }
  
  public void show(int W, int H, int MARGIN){
    this.on_screen=true;
    
    for(int i=0; i < sizeW; i++){
      for(int j=0; j<sizeH; j++){
        this.grid[i][j].updateOnScreen();
        
      }
    }
    
  }
  
  public void clear(){
    for(int i=0; i < sizeW; i++){
      for(int j=0; j<sizeH; j++){
        this.grid[i][j].reset();
        this.grid[i][j].updateOnScreen();
      }
    }
  
  }
  
  public void reset(){
    for(int i=0; i < sizeW; i++){
      for(int j=0; j<sizeH; j++){
       if(this.grid[i][j].getState()){
        this.grid[i][j].reset();
        this.grid[i][j].updateOnScreen(); 
        }
      }
  
    }
  }
}
