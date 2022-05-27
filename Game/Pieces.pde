// individual piece not the array
public class Pieces{
  PImage piece;
  color col;
  int x;
  int y;
  boolean isDead;
  
  Pieces(color c_, int x_, int y_){
    col = c_;
    x = x_;
    y = y_;
    isDead = false;
  }
  
  void kill(){
    isDead = true;
  }
 
  void show(){ //not in prototype- not sure if we need
    if (!isDead && piece != null){
      //can we put this in the constructor- I'm not sure cause this class doesn't have anything for piece
      piece.resize(100, 100); //works w our default size but p need to check wh
      image(piece, x, y);
    }
  }
 
  void move(int x_, int y_){
    /*
    not sure if we should j draw a Square over n replace it in the spaces array
    or have it in Square when set null idk
    spaces[x/8??][y/8].setPiece(null);
    bc 100,100 is 2,2 but not tested cause I'm having issues w the Squares
    spaces[log10(x)][log10(y)].setPiece(null);
    */
    x = x_;
    y = y_;
    image(piece, x, y);
  }
  
}

//move to a new tab- j testing it first
class Pawn extends Pieces{
  Pawn(color c_, int x_, int y_){
    super(c_, x_, y_);
    setImage();
  }
  void setImage(){
    if (col == 0){
      //works with other images (chess.jpeg)
      piece = loadImage("Black_Pawn.png");
    }else if (col == 255){
      piece = loadImage("White_Pawn.png");
    } 
  }
}

class Knight extends Pieces{
  Knight(color c_, int x_, int y_){
    super(c_, x_, y_);
    setImage();
  }
  void setImage(){
    if (col == 0){
      //works with other images (chess.jpeg)
      piece = loadImage("Black_Knight.png");
    }else if (col == 255){
      piece = loadImage("White_Knight.png");
    } 
  }
}

class Rook extends Pieces{
  Rook(color c_, int x_, int y_){
    super(c_, x_, y_);
    setImage();
  }
  void setImage(){
    if (col == 0){
      //works with other images (chess.jpeg)
      piece = loadImage("Black_Rook.png");
    }else if (col == 255){
      piece = loadImage("White_Rook.png");
    } 
  }
}

class Queen extends Pieces{
  Queen(color c_, int x_, int y_){
    super(c_, x_, y_);
    setImage();
  }
  void setImage(){
    if (col == 0){
      //works with other images (chess.jpeg)
      piece = loadImage("Black_Queen.png");
    }else if (col == 255){
      piece = loadImage("White_Queen.png");
    } 
  }
}

class King extends Pieces{
  King(color c_, int x_, int y_){
    super(c_, x_, y_);
    setImage();
  }
  void setImage(){
    if (col == 0){
      //works with other images (chess.jpeg)
      piece = loadImage("Black_King.png");
    }else if (col == 255){
      piece = loadImage("White_King.png");
    } 
  }
}
