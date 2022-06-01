import javax.swing.*;
Board b;
boolean tit = false;
Player[] players = new Player[2];
int current = 0;

void setup() {
  size(850, 850);
  title();
}

void draw() {
  if (!tit) {
    b.update();
  }
}

void mouseClicked() {
  if (tit == false) {
    //use try catch later to check for out of bounds
    String nameTurn = "";
    //While game still going on
    if (current == 0) {
      nameTurn =  players[0].getName();
      current++;
    } else {
      nameTurn = players[1].getName();
      current = 0;
    }
    String first;
    first = getS(nameTurn + " Select unit: ");
    String loc = getS(nameTurn + " Enter placement: "); 
    b.move(first, loc);
  }
}

boolean validIn(String x) { //have this check if input commands are valid
  return true;
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
