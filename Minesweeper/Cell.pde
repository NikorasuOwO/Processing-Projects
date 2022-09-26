class Cell {
  
  boolean visible;
  boolean bomb;
  boolean flagged;
  byte adj;
  int x;
  int y;

  Cell(){
  
    this.visible = false;
    this.bomb = false;
    this.adj = -1;
    this.flagged = false;
  
  }
  
  public void makeVisible(){
    this.visible = true;
    
    if(this.adj == 0){
      g.revealNeighbors(this.x, this.y);
      return;
    }else{return;}
  }

  public void flag(){
    
    this.flagged = !this.flagged;
  
  }

}
