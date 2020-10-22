void gameOver() {
  music.pause();
  background(210, 225, 213);
  fill(0);
  textSize(110);
  if (ai == false) {
    cheering.play();

    if (leftScore > rightScore) {
      fill(99, 93, 103);
      text("LEFT PLAYER WON!", width/2, height/3);
    } else {
      fill(122, 176, 160);
      text("RIGHT PLAYER WON!", width/2, height/3);
    }
  } else {
    if (leftScore > rightScore) {
      fill(99, 93, 103);
      text("YOU WON!", width/2, height/3);
      cheering.play();
    } else {
      fill(122, 176, 160);
      text("YOU LOST!", width/2, height/3);
      lose.play();
    }
  }

  //play again button
  tactileRect(150, 450, 200, 100, "REPLAY", 250, 500);

  //quit button
  tactileRect(450, 450, 200, 100, "QUIT", 550, 500);
}

void gameOverClicks() {

  //replay button
  if (mouseX > 150 && mouseX < 350 && mouseY > 450 && mouseY < 550) {
    mode = INTRO;
    leftScore = 0;
    rightScore = 0;
    leftY = height/2;
    rightY = height/2;
    vx = random(-5, 5);
    vy = random(-1, 1);
    music.loop();
  }

  //quit button
  if (mouseX > 450 && mouseX < 650 && mouseY > 450 && mouseY < 550) exit();
}
