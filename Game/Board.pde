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
    boolean alternate = false;
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
    fill(0);
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
    spaces[0][2] = new Square(2, 0, new Bishop(0));
    spaces[0][3] = new Square(3, 0, new Queen(0));
    spaces[0][4] = new Square(4, 0, new King(0));
    spaces[0][5] = new Square(5, 0, new Bishop(0));
    spaces[0][6] = new Square(6, 0, new Knight(0));
    spaces[0][7] = new Square(7, 0, new Rook(0));
    for(int i = 0; i <= 7; i++){
     spaces[1][i] = new Square(i, 1, new Pawn(0));  
    }
    
    for(int i = 0; i <= 7; i++){
      spaces[6][i] = new Square(i, 6, new Pawn(255));
    }
    spaces[7][0] = new Square(0, 7, new Rook(255));
    spaces[7][1] = new Square(1, 7, new Knight(255));
    spaces[7][2] = new Square(2, 7, new Bishop(255));
    spaces[7][3] = new Square(3, 7, new Queen(255));
    spaces[7][4] = new Square(4, 7, new King(255));
    spaces[7][5] = new Square(5, 7, new Bishop(255));
    spaces[7][6] = new Square(6, 7, new Knight(255));
    spaces[7][7] = new Square(7, 7, new Rook(255));
    
    for(int i = 2; i < 6; i++){
      for(int k = 0; k <= 7; k++){
        spaces[i][k] = new Square(i, k, null);
      }
    }
  }
  
  Square squareAt(int x, int y){
    return spaces[x][y];
  }
  
  
  void reset(){
   create(); 
  }
}
