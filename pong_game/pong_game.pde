//Charlotte Jacques
//Block 1-2 B

/*TO DO:
 - Set speed to be constant
 - Get ball to move faster after bouncing off paddle*/

//minim imports
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//mode variables
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//title variable
int titleX, bounceSpeed;

//single-player variable
boolean ai;

//paddle + ball variables
float leftX, leftY, leftD, rightX, rightY, rightD;
float ballX, ballY, ballD, vx, vy;

//keyboard variables 
boolean wKey, sKey, upKey, downKey;

//score variables
int leftScore, rightScore, timer;

//font variables
PFont inkyThinPixels;

//sound variables
Minim minim;
AudioPlayer music, leftPaddle, rightPaddle, score, wall, cheering, lose;

void setup() {
  size(800, 600);
  mode = INTRO;
  textAlign(CENTER, CENTER);

  //title variable
  titleX = width/2;
  bounceSpeed = 4;

  //paddle variables
  leftX = 0;
  leftY = 300;
  leftD = 200;
  rightX = 800;
  rightY = 300;
  rightD = 200;

  //ball variables
  ballX = width/2;
  ballY = height/2;
  ballD = 100;
  vx = random(-5, 5);
  vy = random(-1, 1);

  //keyboard variables
  wKey = false;
  sKey = false;
  upKey = false;
  downKey = false;

  //score variables
  leftScore = 0;
  rightScore = 0;
  timer = 50;

  //font variables
  inkyThinPixels = createFont("InkyThinPixels.ttf", 200);
  textFont(inkyThinPixels);

  //sound variables
  minim = new Minim (this);
  music = minim.loadFile("music.wav");
  music.loop();
  leftPaddle = minim.loadFile("leftpaddle.wav");
  rightPaddle = minim.loadFile("rightpaddle.wav");
  score = minim.loadFile("score.wav");
  wall = minim.loadFile("wall.wav");
  cheering = minim.loadFile("clapping.wav");
  lose = minim.loadFile("lose.wav");
}

void draw() {
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameOver();
  else println("Error - mode = " + mode);
}
