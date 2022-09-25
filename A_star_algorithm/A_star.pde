import java.util.*;
// A tar algorith


// Let h(x) = euclideanDistance(x, GOAL)
// Let g(x): distance travelled from START to x
// Let f(x) = min(h(x)+g(x))


public ArrayList<Item> A_star(){
  
  println("STARTING A* ALGORITHM");
  
  ArrayList<Item> path = new ArrayList<>(1);
  PriorityQueue<Item> pq = new PriorityQueue<Item>();
  int currentGVal = 0;
  Item startItem = new Item(START, 0);
  Item goalItem;
  Item workingItem = startItem;
  Item prevWorkingItem=null;
  
  do{
    currentGVal++;
    for(Node node:workingItem.node.getNb()){
      if (node.getState()) pq.add(new Item(node, currentGVal, workingItem));
      
      node.setColor(200,200,255);
      node.updateOnScreen();
    }
    
    prevWorkingItem = workingItem;
    workingItem = pq.poll();
    if (workingItem.g < currentGVal){ //When we go back and forth on the same node.
      currentGVal = workingItem.g;

    }
  }while(!pq.peek().node.equals(G));
  
  goalItem = pq.peek();
  workingItem = goalItem;
  
  while(!workingItem.equals(startItem)){
    path.add(workingItem);
    workingItem = workingItem.parent;
  }
  
  Collections.reverse(path);
  
  print("A* ALGORITHM ENDED. PATH IS:  ");
  println(path);
  return path;
  
}

public class Item implements Comparable<Item>{
  
  Node node;
  float f;
  int g;
  float h;
  Item parent = null;
  
  public Item(Node node, int g){
    this.node = node;
    this.g = g;
    this.h = sqrt((this.node.getX()-G.getX())*(this.node.getX()-G.getX())+(this.node.getY()-G.getY())*(this.node.getY()-G.getY()));
    this.f = h+g;
  }
  
  public Item(Node node, int g, Item parent){
    this.node = node;
    this.g = g;
    this.h = sqrt((this.node.getX()-G.getX())*(this.node.getX()-G.getX())+(this.node.getY()-G.getY())*(this.node.getY()-G.getY()));
    this.f = h+g;
    this.parent=parent;
  } 
  
  public int compareTo(Item item){
    return (int) (this.f - item.f)*1000;
  }
  
  public boolean equals(Item item){
    return this.node.equals(item.node);
  }
  
  public String toString(){
    return this.node.toString();
  }
  
}
