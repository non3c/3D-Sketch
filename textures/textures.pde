PImage shroomlight;
PImage goldblock;
PImage smoothquartz;
PImage netheriteblock;
float rotx, roty;

void setup() {
  size(1400, 800, P3D);
  shroomlight = loadImage("ShroomLight.png");
  goldblock = loadImage("GoldBlock.png");
  smoothquartz = loadImage("SmoothQuartz.png");
  netheriteblock = loadImage("NetheriteBlock.png");
  textureMode(NORMAL);
}

void draw() {
  background(255);
  pushMatrix();

  translate(width/2, height/2, 0);
  scale(100);
  rotateX(rotx);
  rotateY(roty);
  noStroke();
  drawGround();
  texturedBlock(0, 0, 0, shroomlight, shroomlight, goldblock, goldblock, netheriteblock, netheriteblock, 1);
  popMatrix();
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
  int x = -5, y = -5;
  while (x <= 5) {
    texturedBlock(x, 2, y, netheriteblock, 1);
    x = x + 1;
    if (x >= 5) {
      y = y + 1;
      x = -5;
    }
    if (y >= 5) break;
  }
}

void mouseDragged() {
  rotx += (pmouseY - mouseY)*0.01;
  roty += -(pmouseX - mouseX)*0.01;
}
