import javax.swing.*;
Board b;
boolean tit = false;
Player[] players = new Player[2];
int current = 0;
int CLICK_MODE;
final int FIRST = 0;
final int LOC = 1;
final int NEXT_PLAY = 2;
String first;

void setup() {
  size(850, 850);
  title();
}

void draw() {
  if (!tit) {
    b.update();
  }
}

String mouseSquare(int x, int y){
  char c = char(65 + (x / 100));
  y = y / 100 + 1;
  String sq = c + str(y);
  return sq;
}

void mouseClicked() {
  if (tit == false) {
     if (CLICK_MODE == FIRST){
      first = mouseSquare(mouseX, mouseY);
      println(first);
      CLICK_MODE++;
      // text(first, 800, 800);
    }else if (CLICK_MODE == LOC){
      String loc = mouseSquare(mouseX, mouseY);
      CLICK_MODE=0;
      // text(first + " " + loc, width - 50, width - 50);
      b.move(first, loc);
    }
    //else if (CLICK_MODE == NEXT_PLAY){
    //  text(players[current].getName(), 800, 800);
    //  if (current == 0){
    //    current++;
    //  }else{
    //    current = 0;
    //  }
    //  CLICK_MODE = 0;
    //}
  }
}

boolean validIn(String x) { //have this check if input commands are valid
  if (x.length() == 2) {
    String lLoc = x.substring(0, 1);
    int iLoc;
    try {
      iLoc = Integer.parseInt(x.substring(1));
    }
    catch(Exception e) {
      return false;
    }
    if (lLoc.compareTo("A") >=0 && lLoc.compareTo("H") <= 0) {
      if (iLoc >= 1 && iLoc <= 8) {
        return true;
      }
    }
  }
  return false;
}


void startGame() {
  b = new Board();
  tit = false;
}


void keyPressed() {
  if (key == ' ') {
    startGame();
    String name1 = "";
    String name2 = "";
    while (name1.length() == 0) {
      name1 = getS("Enter Player 1 Name: ");
    }
    while (name2.length() == 0) {
      name2 = getS("Enter Player 2 Name: ");
    }
    players[0] = new Player(name1, 255);
    players[1] = new Player(name2, 0);
  } else if (key == '`') {
    title();
    startGame();
  } else if (key == 'p') {
    exit();
  }
}

void title() {
  tit = true;
  background(0);
  PImage titlescreen = loadImage("chess.jpeg");
  image(titlescreen, 110, 248);
  //int x = titlescreen.width;
  //int y = titlescreen.height;
  //print(x + " " + y);
  textSize(50);
  fill(255);
  text("CHESS", width/2 - 90, 198);
  text("Press SPACEBAR to start", 140, 652);
}


String prompt(String s)
{
  println(s);
  String entry = JOptionPane.showInputDialog(s);
  if (entry == null)
    return null;
  println(entry);
  return entry;
}

String getS(String s)
{
  return prompt(s);
}

int getI(String s)
{
  return Integer.parseInt(getS(s));
}
