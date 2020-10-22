void pause() {
  textSize(25);
  text("GAME PAUSED", width/2, 200);
  
  //play button
  tactileCircle(750, 50, 25);
  fill(0);
  strokeWeight(1);
  triangle(743, 30, 743, 70, 763, 50);
}

void pauseClicks() {
  if(dist(mouseX, mouseY, 750, 50) < 25) {
    mode = GAME;
  }
}
