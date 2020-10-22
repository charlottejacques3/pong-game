void game() {
  background(210, 225, 213);
  cheering.rewind();
  lose.rewind();

  //division line
  stroke(1);
  line(400, 0, 400, 600);
  noStroke();

  //draw paddles
  fill(99, 93, 103);
  circle(leftX, leftY, leftD);
  fill(122, 176, 160);
  circle(rightX, rightY, rightD);

  //move paddles
  if (wKey == true) leftY = leftY - 5;
  if (sKey == true) leftY = leftY + 5;

  if (ai == false) {
    if (upKey == true) rightY = rightY - 5;
    if (downKey == true) rightY = rightY + 5;
  } else {
    if (ballX > width/2) {
      if (ballY < rightY) rightY -= 2;
      if (ballY > rightY) rightY += 2;
    }
  }

  //stop paddles from moving off screen
  if (leftY < leftD/2) leftY = leftD/2;
  if (leftY > height-leftD/2) leftY = height-leftD/2;
  if (rightY < rightD/2) rightY = rightD/2;
  if (rightY > height-rightD/2) rightY = height-rightD/2;

  //stop ball from moving off screen
  if (ballY < ballD/2) ballY = ballD/2;
  if (ballY > height-ballD/2) ballY = height-ballD/2;

  //draw ball
  fill(15);
  circle(ballX, ballY, ballD);

  //move ball 
  timer--;
  if (timer < 0) {
    ballX += vx;
    ballY += vy;
  }

  //bounce off wall
  if (ballY < ballD/2 || ballY > height - ballD/2) {
    vy = vy*-1;
    wall.rewind();
    wall.play();
  }

  //bounce off paddle
  if (dist(leftX, leftY, ballX, ballY) <= leftD/2 + ballD/2) {
    vx = (ballX - leftX)/30;
    vy = (ballY - leftY)/30;
    leftPaddle.rewind();
    leftPaddle.play();
  }
  if (dist(rightX, rightY, ballX, ballY) <= rightD/2 + ballD/2) {
    vx = (ballX - rightX)/30;
    vy = (ballY - leftY)/30;
    rightPaddle.rewind();
    rightPaddle.play();
  }

  //"you" label
  if (ai == true) {
    textSize(60);
    text("YOU", leftX + leftD/4, leftY);
  }

  //draw score
  fill(0);
  textSize(20);
  text("Score: " + leftScore, 200, 50);
  text("Score: " + rightScore, 600, 50);

  //score points
  if (ballX < ballD/2) {
    rightScore++;
    ballX = width/2;
    ballY = height/2;
    timer = 50;
    vx = random(-5, 5);
    vy = random(-1, 1);
    score.rewind();
    score.play();
  } else if (ballX > width - ballD/2) {
    leftScore++;
    ballX = width/2;
    ballY = height/2;
    timer = 50;
    vx = random(-5, 5);
    vy = random(-1, 1);
    score.rewind();
    score.play();
  }

  //pause button
  tactileCircle(750, 50, 25);
  fill(0);
  strokeWeight(1);
  rect(741.5, 32.5, 5, 35);
  rect(754.5, 32.5, 5, 35);

  //end game
  if (rightScore >= 3 || leftScore >= 3) mode = GAMEOVER;
}

void gameClicks() {

  //pause button
  if (dist(mouseX, mouseY, 750, 50) < 25) mode = PAUSE;
}
