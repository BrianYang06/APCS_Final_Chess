public class Square {
  Pieces Occupant;
  color colr = 0;  
  int lengthSquare;

  public Square(int x, int y, int z) {
    lengthSquare = (width - 50) / 8;
    if (z == 0) {
      colr = color(colr);
    } else if (z == 1) {
      colr = color(255 - colr);
    }
    fill(colr);
    square(x, y, lengthSquare);
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
