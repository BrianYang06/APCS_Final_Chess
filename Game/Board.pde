public class Board {
  int bLength = 800;
  final Square[][] spaces = new Square[8][8];

  public void create() {
    rect(0, 0, bLength, bLength);

    //Creation of the Checkered Board Pattern
    boolean alternate = true;
    for (int i = 0; i < spaces.length; i++) {
      for (int j = 0; j < spaces[0].length; j++) {
        alternate = !alternate;
        if (alternate == false) {
          spaces[i][j] = new Square(i * bLength / 8, j * 100, 0);
        } else if (alternate == true) {
          spaces[i][j] = new Square(i * bLength / 8, j * 100, 1);
        }
      }
      if (alternate == true) {
        alternate = !alternate;
      } else alternate = !alternate;
    }
    
    //Creation of the Letters/Numbers
    int j = 0;
    for(char i = 'A'; i < 'Z'; i++){
     text(i, j * bLength/8 + 50, bLength + (height - bLength)/2); 
     j++;
    }
        
    for(int i = 1; i < 9; i++){
      text(i, bLength+ (height - bLength)/2, i * bLength/8 - 50);
    }
  }
}
