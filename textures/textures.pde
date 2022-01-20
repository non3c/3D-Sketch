PImage shroomlight;
PImage goldblock;
PImage smoothquartz;
PImage netheriteblock;
float rotx, roty;
boolean wkey, akey, skey, dkey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;

void setup() {
  size(1400, 800, P3D);
  shroomlight = loadImage("ShroomLight.png");
  goldblock = loadImage("GoldBlock.png");
  smoothquartz = loadImage("SmoothQuartz.png");
  netheriteblock = loadImage("NetheriteBlock.png");
  textureMode(NORMAL);
  wkey = akey = skey = dkey = false;
  eyeX = width/2;
  eyeY = height/2;
  eyeZ = 0;
  focusX = width/2;
  focusY = height/2;
  focusZ = 10;
  tiltX = 0;
  tiltY = 0.5;
  tiltZ = 0;
}

void draw() {
  background(255);
  pushMatrix();
  translate(width/2, height/2, 0);
  scale(100);

  //rotateX(rotx);
  //rotateY(roty);

  noStroke();
  drawGround();
  //controlCamera();
  popMatrix();
  texturedBlock(0, 0, 0, shroomlight, shroomlight, goldblock, goldblock, netheriteblock, netheriteblock, 1);
}

void texturedBlock(int x, int y, int z, PImage tex, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  noStroke();

  beginShape(QUADS);
  texture(tex);
  //top
  //     x, y, z, tx, ty
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);

  //bottom
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  //front
  vertex(0, 1, 1, 0, 0);
  vertex(1, 1, 1, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);


  //back 
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 0, 0, 1, 1);
  vertex(0, 0, 0, 0, 1);

  //left
  vertex(0, 1, 0, 0, 0);
  vertex(0, 1, 1, 1, 0);
  vertex(0, 0, 1, 1, 1);
  vertex(0, 0, 0, 0, 1);
  //right
  vertex(1, 1, 0, 0, 0);
  vertex(1, 1, 1, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(1, 0, 0, 0, 1);

  endShape();
  popMatrix();
}

void texturedBlock(int x, int y, int z, PImage top, PImage bottom, PImage front, PImage back, PImage left, PImage right, int size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  noStroke();
  //     x, y, z, tx, ty
  //top
  beginShape(QUADS);
  texture(top);
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
  endShape();

  //bottom
  beginShape(QUADS);
  texture(bottom);
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  endShape();

  //front
  beginShape(QUADS);   
  texture(front);
  vertex(0, 1, 1, 0, 0);
  vertex(1, 1, 1, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
  endShape();

  //back 
  beginShape(QUADS);   
  texture(back);
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 0, 0, 1, 1);
  vertex(0, 0, 0, 0, 1);
  endShape();

  //left
  beginShape(QUADS);   
  texture(left);
  vertex(0, 1, 0, 0, 0);
  vertex(0, 1, 1, 1, 0);
  vertex(0, 0, 1, 1, 1);
  vertex(0, 0, 0, 0, 1);
  endShape();

  //right
  beginShape(QUADS);   
  texture(right);
  vertex(1, 1, 0, 0, 0);
  vertex(1, 1, 1, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(1, 0, 0, 0, 1);
  endShape();

  popMatrix();
}

void drawGround() {
  noLoop();
  int x = -20, y = -20;
  while (x <= 20) {
    texturedBlock(x, 2, y, netheriteblock, 1);
    x = x + 1;
    if (x >= 20) {
      y = y + 1;
      x = -20;
    }
    if (y >= 20) break;
  }
}

//void controlCamera() {
//  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
//  if (wkey) eyeZ += 10;
//  if (skey) eyeZ -= 10;
//  if (akey) eyeX += 10;
//  if (dkey) eyeX -= 10;

//  focusX = eyeX;
//  focusY = eyeY;
//  focusZ = eyeZ + 10;
//}

//void keyPressed() {
//  if (keyCode == 'W')        wkey = true;
//  if (keyCode == 'S')        skey = true;
//  if (keyCode == 'A')        akey = true;
//  if (keyCode == 'D')        dkey = true;
//}

//void keyReleased() {
//  if (keyCode == 'W')       wkey = false;
//  if (keyCode == 'S')       skey = false;
//  if (keyCode == 'A')       akey = false;
//  if (keyCode == 'D')       dkey = false;
//}

void mouseDragged() {
  rotx += (pmouseY - mouseY)*0.01;
  roty += -(pmouseX - mouseX)*0.01;
}
