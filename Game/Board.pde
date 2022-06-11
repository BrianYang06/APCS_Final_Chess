public class Board {
  int bLength = 800;
  Square[][] spaces = new Square[8][8];

  public Board() {
    create();
  }

  Square squareAt(int x, int y) {
    return spaces[x][y];
  }

  public void create() {
    textSize(12);
    background(255);
    rect(0, 0, bLength, bLength);

    //Creation of the Checkered Board Pattern
    createCheckered();
    //Creation of the Letters/Numbers
    fill(0);
    int j = 0;
    for (char i = 'A'; i < 'I'; i++) {
      text(i, j * bLength/8 + 50, bLength + (height - bLength)/2); 
      j++;
    }

    for (int i = 1; i < 9; i++) {
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
    for (int i = 0; i <= 7; i++) {
      spaces[1][i] = new Square(i, 1, new Pawn(0));
    }

    for (int i = 0; i <= 7; i++) {
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


    for (int i = 2; i < 6; i++) {
      for (int k = 0; k <= 7; k++) {
        spaces[i][k] = new Square(k, i, null);
      }
    }

    for (int i = 0; i <=7; i++) {
      for (int k = 0; k <= 7; k++) {
        if (spaces[i][k] != null) {
          if (spaces[i][k].getOccupant() != null) {
            textSize(20);
            text(spaces[i][k].getOccupant().name(), k * 100, i * 100 + 100);
          } else if (spaces[i][k].getOccupant() == null) {
            text("null", k * 100, i * 100 + 100);
          }
        }
      }
    }
    createCheckered();
  }

  void move(String first, String place) {
    String fLetter = first.substring(0, 1);
    int fStringNum = lToN(fLetter);
    int fNum = Integer.parseInt(first.substring(1)) - 1;


    String pLetter = place.substring(0, 1);
    int pStringNum = lToN(pLetter);
    int pNum = Integer.parseInt(place.substring(1)) - 1;

    if (canMove(fStringNum, fNum, pStringNum, pNum)) {
      Pieces x = spaces[fNum][fStringNum].getPiece();
      spaces[fNum][fStringNum].setPiece(null);
      spaces[pNum][pStringNum].setPiece(x);
    }
  }

  boolean canMove(int firstX, int firstY, int lastX, int lastY) {
    println("Last X: " + lastX);
    println("Last Y: " + lastY);
    println("First Y: " + firstY);
    println("First X: " + firstX);


    //piece of same color in last
    Pieces inNew = spaces[lastY][lastX].getOccupant();
    Pieces inOld = spaces[firstY][firstX].getOccupant();
    if (inNew != null) {
      if ((inOld.col == 255 && inNew.col == 255) ||
        (inOld.col == 0 && inNew.col == 0)) {
        return false;
      }
    }

    //out of bounds
    /*  if (firstX < 0 || firstX > 7 || firstY < 0 || firstY > 7
     || lastX < 0 || lastX > 7 || lastY < 0 || lastY > 8) {
     return false;
     } */

    if (inOld.name().equals("pawn")) {
      //white side basic movement 

      if (inOld.col == 255) { //2 jump from start
        if (firstY == 6) {
          if (lastY == 4 && lastX == firstX) {
            return true;
          }
        } 

        if (firstY - 1 == lastY && lastX == firstX) {
          println(spaces[lastY][lastX].getOccupant());
          if (spaces[lastY][lastX].isEmpty()) {
            return true;
          }
        }
        //capturing right side
        if (firstX + 1 == lastX) {
          if (firstY - 1 == lastY && spaces[lastY][lastX].getOccupant() != null && spaces[lastY][lastX].getOccupant().col != 255) {
            return true;
          }
        }
        //capture left
        if (firstX - 1 == lastX) {
          if (firstY - 1 == lastY && spaces[lastY][lastX].getOccupant() != null && spaces[lastY][lastX].getOccupant().col != 255) {
            return true;
          }
        }
      }


      if (inOld.col == 0) { //black side
        if (firstY == 1) { //2 jump
          if (lastY == 3 && lastX == firstX) {
            return true;
          }
        }
        if (firstY + 1 == lastY && lastX == firstX) { //single tile move
          println(spaces[lastY][lastX].getOccupant());
          if (spaces[lastY][lastX].isEmpty()) {
            return true;
          }
        }
        //capturing right side
        if (firstX + 1 == lastX) {
          if (firstY + 1 == lastY && spaces[lastY][lastX].getOccupant() != null && spaces[lastY][lastX].getOccupant().col != 0) {
            return true;
          }
        }
        //capture left
        if (firstX - 1 == lastX) {
          if (firstY + 1 == lastY && spaces[lastY][lastX].getOccupant() != null && spaces[lastY][lastX].getOccupant().col != 0) {
            return true;
          }
        }
      }
    }

    if (inOld.name().equals("king")) {
      //right 
      if ((firstX + 1 == lastX || firstX - 1 == lastX || lastX == firstX) && (firstY + 1 == lastY || firstY - 1 == lastY || lastY == firstY)) {
        return true;
      }
    }

    if (inOld.name().equals("queen")) {
      int amountBlocking = 0;
      int amountBlock = 0;
      boolean blocking = false;
      if ((firstX + 1 == lastX || firstX - 1 == lastX || lastX == firstX) && (firstY + 1 == lastY || firstY - 1 == lastY || lastY == firstY)) {
        return true;
      }
            boolean moveVert = false;
      boolean moveHor = false;
      //making sure its horizontal/vertical
      if (firstX == lastX && firstY != lastY) {
        moveVert = true;
      } else if (firstY == lastY && firstX != lastX) {
        moveHor = true;
      }
      //check if hitting something when moving horizontal
      if (moveHor) {
        for (int j = firstX; j < lastX; j++) { //collision right
          if (spaces[firstY][j].isEmpty() == false && amountBlock >= 0) {
            amountBlock++;
            blocking = true;
          }
        }
        if (amountBlock == 1 || amountBlock == 0 && !spaces[firstY][lastX].isEmpty()) {
          blocking = false;
        }

        for (int j = lastX; j < firstX; j++) { //collision left
          if (spaces[firstY][j].isEmpty() == false && amountBlock >= 0) {
            amountBlock++;
            blocking = true;
          }
        }
        if (amountBlock == 1 && !spaces[firstY][lastX].isEmpty()) {
          blocking = false;
        }
      }
      //check collision when moving vertical
      if (moveVert) {
        for (int j = firstY; j < lastY; j++) { //top to bottom
          if (spaces[j][firstX].isEmpty() == false && amountBlock >= 0) {
            amountBlock++;
            blocking = true;
          }
        }
        if (amountBlock == 1 || amountBlock == 0 && !spaces[firstY][lastX].isEmpty()) {
          blocking = false;
        }

        for (int j = lastY; j < firstY; j++) { //bottom to top
          if (spaces[j][firstX].isEmpty() == false && amountBlock >= 0) {
            print(spaces[j][firstX].getPiece().name());
            amountBlock++;
            blocking = true;
          }
        }
        if (amountBlock == 1 && spaces[firstX][lastY].isEmpty()) {
          blocking = false;
        }
      }  

      //valid movement checker
      if (blocking == true) {
        return false;
      } else if (moveHor || moveVert) {
        return true;
      }
      int tempX = abs(firstX - lastX);
      int tempY = abs(firstY - lastY);
      if (tempX == tempY) {
        //top left
        if (firstX > lastX && firstY > lastY) {
          while (firstX != lastX  && firstY != lastY ) {
            firstX--;
            firstY--;
            if (spaces[firstY][firstX].isEmpty() == false ) {
              print(spaces[firstY][firstX].getPiece().name());
              blocking = true;
              amountBlocking++;
              if (amountBlocking == 1 && !spaces[lastY][lastX].isEmpty()) {
                blocking = false;
              }
            }
          }
        } else if (firstX < lastX && firstY > lastY) { //top Right
          while (firstX != lastX  && firstY != lastY ) {
            firstX++;
            firstY--;
            if (spaces[firstY][firstX].isEmpty() == false ) {
              print(spaces[firstY][firstX].getPiece().name());
              blocking = true;
              amountBlocking++;
              if (amountBlocking == 1 && !spaces[lastY][lastX].isEmpty()) {
                blocking = false;
              }
            }
          }
        } else if (firstX > lastX && lastY > firstY) { //bottom left
          while (firstX != lastX  && firstY != lastY ) {
            firstX--;
            firstY++;
            if (spaces[firstY][firstX].isEmpty() == false ) {
              print(spaces[firstY][firstX].getPiece().name());
              blocking = true;
              amountBlocking++;
              if (amountBlocking == 1 && !spaces[lastY][lastX].isEmpty()) {
                blocking = false;
              }
            }
          }
        } else if (firstX < lastX && firstY < lastY) { //bottom right
          firstX++;
          firstY++;
          if (spaces[firstY][firstX].isEmpty() == false ) {
            print(spaces[firstY][firstX].getPiece().name());
            blocking = true;
            amountBlocking++;
            if (amountBlocking == 1 && !spaces[lastY][lastX].isEmpty()) {
              blocking = false;
            }
          }
        }

        if (blocking) {
          return false;
        } else return true;
      }
    }


    if (inOld.name().equals("rook")) {
      boolean moveVert = false;
      boolean moveHor = false;
      //making sure its horizontal/vertical
      if (firstX == lastX && firstY != lastY) {
        moveVert = true;
      } else if (firstY == lastY && firstX != lastX) {
        moveHor = true;
      }
      //check if hitting something when moving horizontal
      boolean blocking = false;
      int amountBlock = 0;
      if (moveHor) {
        for (int j = firstX; j < lastX; j++) { //collision right
          if (spaces[firstY][j].isEmpty() == false && amountBlock >= 0) {
            amountBlock++;
            blocking = true;
          }
        }
        if (amountBlock == 1 || amountBlock == 0 && !spaces[firstY][lastX].isEmpty()) {
          blocking = false;
        }

        for (int j = lastX; j < firstX; j++) { //collision left
          if (spaces[firstY][j].isEmpty() == false && amountBlock >= 0) {
            amountBlock++;
            blocking = true;
          }
        }
        if (amountBlock == 1 && !spaces[firstY][lastX].isEmpty()) {
          blocking = false;
        }
      }
      //check collision when moving vertical
      if (moveVert) {
        for (int j = firstY; j < lastY; j++) { //top to bottom
          if (spaces[j][firstX].isEmpty() == false && amountBlock >= 0) {
            amountBlock++;
            blocking = true;
          }
        }
        if (amountBlock == 1 || amountBlock == 0 && !spaces[firstY][lastX].isEmpty()) {
          blocking = false;
        }

        for (int j = lastY; j < firstY; j++) { //bottom to top
          if (spaces[j][firstX].isEmpty() == false && amountBlock >= 0) {
            print(spaces[j][firstX].getPiece().name());
            amountBlock++;
            blocking = true;
          }
        }
        if (amountBlock == 1 && spaces[firstX][lastY].isEmpty()) {
          blocking = false;
        }
      }  

      //print(blocking);
      //valid movement checker
      if (blocking == true) {
        return false;
      } else if (moveHor || moveVert) {
        return true;
      }
    }

    if (inOld.name().equals("knight")) {
      if (firstX - lastX == 0 || firstY - lastY == 0) {
        return false;
      }
      if (firstX - 1 == lastX && firstY - 2 == lastY) { //top left
        return true;
      }
      if (firstX + 1 == lastX && firstY - 2 == lastY) { //top right
        return true;
      }
      if (firstX - 2 == lastX && firstY - 1 == lastY) { //left up
        return true;
      }
      if (firstX - 2 == lastX && firstY + 1 == lastY) { //left down
        return true;
      }
      if (firstX - 1 == lastX && firstY + 2 == lastY) { //bottom left
        return true;
      }
      if (firstX + 1 == lastX && firstY + 2 == lastY) { //bottom right
        return true;
      }
      if (firstX + 2 == lastX && firstY - 1 == lastY) { //right down
        return true;
      }
      if (firstX + 2 == lastX && firstY + 1 == lastY) { //right up
        return true;
      }
    }

    if (inOld.name().equals("bishop")) {
      boolean blocking = false;
      int amountBlocking = 0;
      int tempX = abs(firstX - lastX);
      int tempY = abs(firstY - lastY);
      if (tempX == tempY) {
        //top left
        if (firstX > lastX && firstY > lastY) {
          while (firstX != lastX  && firstY != lastY ) {
            firstX--;
            firstY--;
            if (spaces[firstY][firstX].isEmpty() == false ) {
              print(spaces[firstY][firstX].getPiece().name());
              blocking = true;
              amountBlocking++;
              if (amountBlocking == 1 && !spaces[lastY][lastX].isEmpty()) {
                blocking = false;
              }
            }
          }
        } else if (firstX < lastX && firstY > lastY) { //top Right
          while (firstX != lastX  && firstY != lastY ) {
            firstX++;
            firstY--;
            if (spaces[firstY][firstX].isEmpty() == false ) {
              print(spaces[firstY][firstX].getPiece().name());
              blocking = true;
              amountBlocking++;
              if (amountBlocking == 1 && !spaces[lastY][lastX].isEmpty()) {
                blocking = false;
              }
            }
          }
        } else if (firstX > lastX && lastY > firstY) { //bottom left
          while (firstX != lastX  && firstY != lastY ) {
            firstX--;
            firstY++;
            if (spaces[firstY][firstX].isEmpty() == false ) {
              print(spaces[firstY][firstX].getPiece().name());
              blocking = true;
              amountBlocking++;
              if (amountBlocking == 1 && !spaces[lastY][lastX].isEmpty()) {
                blocking = false;
              }
            }
          }
        } else if (firstX < lastX && firstY < lastY) { //bottom right
          firstX++;
          firstY++;
          if (spaces[firstY][firstX].isEmpty() == false ) {
            print(spaces[firstY][firstX].getPiece().name());
            blocking = true;
            amountBlocking++;
            if (amountBlocking == 1 && !spaces[lastY][lastX].isEmpty()) {
              blocking = false;
            }
          }
        }

        if (blocking) {
          return false;
        } else return true;
      }

      return false;
    }
    //return true;
    return false;
  }

  int lToN(String x) {
    switch(x) {
    case "A":
      return 0;
    case "B":
      return 1;
    case "C":
      return 2;
    case "D":
      return 3;
    case "E":
      return 4;
    case "F":
      return 5;
    case "G":
      return 6;
    }
    return 7;
  }


  void update() {
    createCheckered();
    for (int i = 0; i < spaces.length; i++) {
      for (int j = 0; j < spaces[0].length; j++) {
        spaces[i][j].show();
      }
    }
  }

  void createCheckered() {
    boolean alternate = false;
    for (int i = 0; i < spaces.length; i++) {
      for (int j = 0; j < spaces[0].length; j++) {
        alternate = !alternate;
        if (alternate == false) {
          fill(105, 180, 105);
          square(i * 100, j * 100, 100);
        } else if (alternate == true) {
          fill(150, 75, 150);
          square(i * bLength/8, j * bLength/8, 100);
        }
      }
      if (alternate == true) {
        alternate = !alternate;
      } else alternate = !alternate;
    }
    fill(0);

    for (int i = 0; i <=7; i++) {
      for (int k = 0; k <= 7; k++) {
        if (spaces[i][k] != null) {
          if (spaces[i][k].getOccupant() != null) {
            textSize(10);
            text(spaces[i][k].getOccupant().name(), k * 100, i * 100 + 100);
          } 
          /*else if (spaces[i][k].getOccupant() == null) {
           text("null", k * 100, i * 100 + 100);
           }*/
        }
      }
    }
  }
}
