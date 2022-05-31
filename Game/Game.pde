Board b;

void setup() {
  size(850, 850);
  title();
}

void draw() {
  for(int i = 0; i <= 7; i++){
    for(int j = 0; i <= 7; j++){
      if(b.spaces[i][j] != null){
       b.spaces[i][j].show();
      }
    }
  }
  
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
