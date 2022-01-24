import java.awt.Robot;

Robot rbt;


color GREEN = #62ff1e; //Leaves


PImage leaves; 
//Map Variables
int gridSize;
int mapHeight;
PImage map;
boolean wkey, akey, skey, dkey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;

boolean skipFrame;

float leftRightHeadAngle, upDownHeadAngle;

void setup() {
  size(displayWidth, displayHeight, P3D);
  textureMode(NORMAL);
  wkey = akey = skey = dkey = false;
  eyeX = width/2;
  eyeY = height/1.20;
  eyeZ = 0;

  focusX = width/2;
  focusY = height/2;
  focusZ = 10;

  tiltX = 0;
  tiltY = 0.5;
  tiltZ = 0;

  leaves = loadImage("leavestest.jpg");

  map = loadImage("map.png");

  gridSize = 100;
  mapHeight = 5;
  leftRightHeadAngle = radians(270);
  noCursor();
  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  skipFrame = false;
}

void draw() {
  background(0);
  pointLight(255, 255, 255, eyeX, eyeY, eyeZ);
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  drawFloor(-2000, 2000, height, gridSize);
  //drawFloor(-2000, 2000, height-gridSize*mapHeight, gridSize);
  drawFocalPoint();
  controlCamera();
  drawMap();
  //lights();
}
void drawFocalPoint() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  sphere(5);

  popMatrix();
}
void drawFloor(int start, int end, int level, int gap) {
  stroke(255);
  strokeWeight(1);
  int x = start;
  int z = start;
  while (z < end) {
    texturedBlock(x, level, z, leaves, gap);
    x += gap;
    if (x >= end) {
      z += gap;
      x = start;
    }
  }
  //for (int x = -2000; x <= 2000; x = x+100) {
  //  line(x, height, -2000, x, height, 2000);
  //  line(-2000, height, x, 2000, height, x);
  //  line(x, height-gridSize*3, -2000, x, height-gridSize*3, 2000);
  //  line(-2000, height-gridSize*3, x, 2000, height-gridSize*3, x);
  //}
}


void controlCamera() {

  if (wkey) {
    eyeX += cos(leftRightHeadAngle)*10;
    eyeZ += sin(leftRightHeadAngle)*10;
  }
  if (skey) {
    eyeX -= cos(leftRightHeadAngle)*10;
    eyeZ -= sin(leftRightHeadAngle)*10;
  }
  if (akey) {
    eyeX -= cos(leftRightHeadAngle +PI/2)*10;
    eyeZ -= sin(leftRightHeadAngle + PI/2)*10;
  }
  if (dkey) {
    eyeX -= cos(leftRightHeadAngle - PI/2)*10;
    eyeZ -= sin(leftRightHeadAngle - PI/2)*10;
  }

  if (skipFrame == false) {
    leftRightHeadAngle += (mouseX - pmouseX)*0.005;
    upDownHeadAngle += (mouseY - pmouseY)*0.005;
  }


  if (upDownHeadAngle > PI/2.5) upDownHeadAngle = PI/2.5;
  if (upDownHeadAngle < -PI/2.5) upDownHeadAngle = -PI/2.5;

  focusX = eyeX + cos(leftRightHeadAngle)*300;
  focusZ = eyeZ + sin(leftRightHeadAngle)*300;
  focusY = eyeY + tan(upDownHeadAngle)*300;


  if (mouseX < 2) {
    rbt.mouseMove(width-3, mouseY);
    skipFrame = true;
  } else if (mouseX > width-2) {
    rbt.mouseMove(3, mouseY);
    skipFrame = true;
  } else {
    skipFrame = false;
  }
}

void drawMap() {
  for (int x = 0; x < map.width; x ++) {
    for (int y = 0; y < map.height; y ++) {

      //println(tempHeight);
      color c = map.get(x, y);
      for (int tempHeight = 1; tempHeight < mapHeight; tempHeight ++) {
        if (c == GREEN) {
          texturedBlock(x*gridSize-2000, height-gridSize*tempHeight, y*gridSize-2000, leaves, gridSize);
        }
      }
    }
  }
}
  void keyPressed() {
    if (keyCode == 'W')        wkey = true;
    if (keyCode == 'S')        skey = true;
    if (keyCode == 'A')        akey = true;
    if (keyCode == 'D')        dkey = true;
  }

  void keyReleased() {
    if (keyCode == 'W')       wkey = false;
    if (keyCode == 'S')       skey = false;
    if (keyCode == 'A')       akey = false;
    if (keyCode == 'D')       dkey = false;
  }
