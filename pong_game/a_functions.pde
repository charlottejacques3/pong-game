//MOUSE FUNCTIONS -----------------------------------------------------------------------

void mouseReleased() {
  if (mode == INTRO) introClicks();
  else if (mode == GAME) gameClicks();
  else if (mode == PAUSE) pauseClicks();
  else if (mode == GAMEOVER) gameOverClicks();
}

//KEYBOARD FUNCTIONS --------------------------------------------------------------------

void keyPressed() {
  if (key == 'w' || key == 'W') wKey = true;
  if (key == 's' || key == 'S') sKey = true;
  if (keyCode == UP) upKey = true;
  if (keyCode == DOWN) downKey = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') wKey = false;
  if (key == 's' || key == 'S') sKey = false;
  if (keyCode == UP) upKey = false;
  if (keyCode == DOWN) downKey = false;
}

//TACTILE FUNCTIONS ---------------------------------------------------------------------

void tactileRect(int x, int y, int w, int h, String buttonText, int textX, int textY) {
  fill(99, 93, 103);
  noStroke();
  rect(x, y, w, h);
  textSize(55);

  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    stroke(155, 193, 168);
    strokeWeight(5);
    rect(x, y, w, h);
    fill(155, 193, 168);
  } else {
    noStroke();
    
    fill(210, 225, 213);
  }
  text(buttonText, textX, textY);
}

void tactileCircle(int x, int y, int r) {

  //make it tactile
  if (dist(mouseX, mouseY, x, y) < r) {
    stroke(0);
    strokeWeight(5);
  } else {
    strokeWeight(1);
  } 

  //regular button
  fill(255);
  circle(x, y, r*2);
}

//OTHER FUNCTIONS -----------------------------------------------------------------------
