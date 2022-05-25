public class Square {
  Pieces Occupant;
  color colr;
  int lengthSquare;

  public Square() {
    lengthSquare = width / 8;
    colr = 
    
  }

  boolean isEmpty() {
    if (Occupant == null) {
      return true;
    } else return false;
  }
  
  void setColor(color x){
   colr = x; 
  }
  
  void setLength(int len){
   lengthSquare = len;  
  }
}
