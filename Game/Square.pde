public class Square {
  Pieces Occupant;
  color colr = 0;  
  int lengthSquare;
  int x;
  int y;

  public Square(int x, int y, Pieces piece) {
    lengthSquare = (width - 50) / 8;
    x *= 100;
    y *= 100;
    this.x = x;
    this.y = y;
    Occupant = piece;
    show();
  }

  void show() { //not in prototype- not sure if we need
    if (Occupant != null && !Occupant.isDead) {
      //can we put this in the constructor- I'm not sure cause this class doesn't have anything for piece
      PImage piece = loadImage(Occupant.setImage());
      piece.resize(100, 100); //works w our default size but p need to check wh
      image(piece, x, y);
    }
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

  void setPiece(Pieces piece) {
    Occupant = piece;
  }


  color getColor() {
    //not in prototype but might be useful to just draw over it
    return colr;
  }

  Pieces getOccupant() {
    return Occupant;
  }
}
