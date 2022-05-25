public class Square {
  Pieces Occupant;
  color colr;
  int lengthSquare;

  public Square(int x, int y, int z) {
    lengthSquare = 800 / 8;
    if (z == 0) {
      colr = color(0);
    } else if (z == 1) {
      colr = color(255);
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
}
