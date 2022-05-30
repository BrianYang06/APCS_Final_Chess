public class Board {
  int bLength = width - 50;
  Square[][] spaces = new Square[8][8];
  
  public Board(){
    create();
  }
  
  public void create() {
    textSize(12);
    background(255);
    rect(0, 0, bLength, bLength);

    //Creation of the Checkered Board Pattern
    boolean alternate = true;
    for (int i = 0; i < spaces.length; i++) {
      for (int j = 0; j < spaces[0].length; j++) {
        alternate = !alternate;
        if (alternate == false) {
          fill(55);
          square(i * 100, j * 100, 100);
        } else if (alternate == true) {
          fill(205);
          square(i * bLength/8, j * bLength/8, 100);
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
    
    //Adding pieces to the board
    spaces[0][0] = new Square(0, 0, new Rook(0));
    spaces[0][1] = new Square(1, 0, new Knight(0)); 
    //spaces[0][2] = new Square(2, 0, new Bishop(255, 2, 0));
    spaces[0][3] = new Square(3, 0, new Queen(0));
    for (int i = 0; i < 8; i++){
      spaces[1][i] = new Square(i, 1, (new Pawn(0)));
    }
    for (int i = 0; i < 8; i++){
      spaces[6][i]= new Square(i, 6, (new Pawn(255)));
    }
  }
  
  
  void reset(){
   create(); 
  }
}
