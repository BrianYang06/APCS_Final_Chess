Board b;
import javax.swing.*;

void setup() {
  size(850, 850);
  title();
  startGame();
}

void draw() {
    b.update();
}

void mouseClicked() {
  //use try catch later to check for out of bounds

  String first = getS("Select unit: ");
  String loc = getS("Enter placement: "); 
  b.move(first, loc);
}

void startGame() {
  b = new Board();
}


void keyPressed() {
  if (key == ' ') {
    startGame();
  } else if (key == '`') {
    startGame();
    title();
  }
}

void title() {
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
