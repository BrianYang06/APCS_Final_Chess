public class Square {
  Pieces Occupant;
  color colr = 0;  
  int lengthSquare;

  public Square(int x, int y, Pieces piece) {
    lengthSquare = (width - 50) / 8;
    x *= 100;
    y*= 100;
    //To create complementary colors
   /* if (clr == 0) {
      colr = color(colr);
    } else if (clr == 1) {
      colr = color(255 - colr);
    }
    */
   
  }

  boolean isEmpty() {
    if (Occupant == null) {
      return true;
    } else return false;
  }

  void setColor(color x) {
    colr = x;
  }

  void setLength(int len) {
    lengthSquare = len;
  }
  
  void setPiece(Pieces piece){
    Occupant = piece;
  }
  
  color getColor(){
    //not in prototype but might be useful to just draw over it
    return colr;
  }
}
