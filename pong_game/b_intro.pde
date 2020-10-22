void intro() {
  background(210, 225, 213);
  cheering.pause();
  lose.pause();
  
  //title
  textSize(200);
  fill(155, 193, 168);
  text("PONG", titleX, height/4+50);
  
  //paddles
  fill(15);
  rect(10, 100, 30, 200);
  rect(width-40, 100, 30, 200);
  
  //title animation
  titleX += bounceSpeed;
  if (titleX > 599) bounceSpeed = -4;
  else if (titleX < 215) bounceSpeed = 4;
  
  //one-player button
  tactileRect(150, 450, 200, 100, "1 PLAYER", 250, 500);

  //two-player button
  tactileRect(450, 450, 200, 100, "2 PLAYER", 550, 500);
  noStroke();
}

void introClicks() {
  //one-player button
  if (mouseX > 150 && mouseX < 350 && mouseY > 450 && mouseY < 550) {
    mode = GAME;
    ai = true;
  }

  //two-player button
  if (mouseX > 450 && mouseX < 650 && mouseY > 450 && mouseY < 550) {
    mode = GAME;
    ai = false;
  }
}
