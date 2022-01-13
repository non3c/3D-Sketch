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
  

  popMatrix();
  controlCamera();
}

void blocks(int x, int y, int z, PImage tex) {
  beginShape(QUADS);
  texture(tex);
  //top
  //     x, y, z, tx, ty
  vertex(x, y, z, 0, 0);
  vertex(x+1, y, z, 1, 0);
  vertex(x+1, y, z+1, 1, 1);
  vertex(x, y, z+1, 0, 1);

  //bottom
  vertex(x, y+1, z, 0, 0);
  vertex(x+1, y+1, z, 1, 0);
  vertex(x+1, y+1, z+1, 1, 1);
  vertex(x, y+1, z+1, 0, 1);

  //front
  vertex(x, y+1, z+1, 0, 0);
  vertex(x+1, y+1, z+1, 1, 0);
  vertex(x+1, y, z+1, 1, 1);
  vertex(x, y, z+1, 0, 1);


  //back 
  vertex(x, y+1, z, 0, 0);
  vertex(x+1, y+1, z, 1, 0);
  vertex(x+1, y, z, 1, 1);
  vertex(x, y, z, 0, 1);

  //left
  vertex(x, y+1, z, 0, 0);
  vertex(x, y+1, z+1, 1, 0);
  vertex(x, y, z+1, 1, 1);
  vertex(x, y, z, 0, 1);
  //right
  vertex(x+1, y+1, z, 0, 0);
  vertex(x+1, y+1, z+1, 1, 0);
  vertex(x+1, y, z+1, 1, 1);
  vertex(x+1, y, z, 0, 1);

  endShape();
}

void drawGround() {
  int x = -20, y = -20;
  while (x <= 20) {
    blocks(x, 1, y, netheriteblock);
    x = x + 1;
    if (x >= 20) {
      y = y + 1;
      x = 0;
    }
    if (y-1 >= 20) break;
  }
}

void controlCamera() {
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  if (wkey) eyeZ += 10;
  if (skey) eyeZ -= 10;
  if (akey) eyeX += 10;
  if (dkey) eyeX -= 10;

  focusX = eyeX;
  focusY = eyeY;
  focusZ = eyeZ + 10;
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

void mouseDragged() {
  rotx += (pmouseY - mouseY)*0.01;
  roty += -(pmouseX - mouseX)*0.01;
}
