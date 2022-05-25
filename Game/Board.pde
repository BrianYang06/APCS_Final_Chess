public class Board {
  int bLength = 800;
  final Square[][] spaces = new Square[8][8];

  public void create() {
    //fill(0);
    rect(0, 0, bLength, bLength);

    boolean alternate = true;
    for (int i = 0; i < spaces.length; i++) {
      for (int j = 0; j < spaces[0].length; j++) {
        alternate = !alternate;
        if (alternate == false) {
          spaces[i][j] = new Square(i * 100, j * 100, 0);
        } else if (alternate == true) {
          spaces[i][j] = new Square(i * 100, j * 100, 1);
        }
      }
      if (alternate == true) {
        alternate = !alternate;
      } else alternate = !alternate;
    }
  }
}
