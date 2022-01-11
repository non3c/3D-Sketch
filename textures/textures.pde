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

  blocks(0, 0, 0, shroomlight);
  blocks(1, 0, 0, goldblock);
  blocks(0, 0, 1, goldblock);
  blocks(-1, 0, 0, goldblock);
  blocks(0, 0, -1, goldblock);
  blocks(0, -1, 0, shroomlight);
  blocks(0, 1, 0, shroomlight);
  blocks(0, 2, 0, netheriteblock);
  blocks(0, 3, 0, netheriteblock);
  blocks(1, 3, 1, netheriteblock);
  blocks(-1, 3, -1, netheriteblock);
  blocks(1, 3, -1, netheriteblock);
  blocks(-1, 3, 1, netheriteblock);
  blocks(1, 2, 1, netheriteblock);
  blocks(-1, 2, -1, netheriteblock);
  blocks(1, 2, -1, netheriteblock);
  blocks(-1, 2, 1, netheriteblock);

  //beginShape(QUADS);
  //texture(goldblock);
  ////top
  ////     x, y, z, tx, ty
  //vertex(1, 0, 0, 0, 0);
  //vertex(2, 0, 0, 1, 0);
  //vertex(2, 0, 1, 1, 1);
  //vertex(1, 0, 1, 0, 1);

  ////bottom
  //vertex(1, 1, 0, 0, 0);
  //vertex(2, 1, 0, 1, 0);
  //vertex(2, 1, 1, 1, 1);
  //vertex(1, 1, 1, 0, 1);

  ////front
  //vertex(1, 1, 1, 0, 0);
  //vertex(2, 1, 1, 1, 0);
  //vertex(2, 0, 1, 1, 1);
  //vertex(1, 0, 1, 0, 1);


  ////back 
  //vertex(1, 1, 0, 0, 0);
  //vertex(2, 1, 0, 1, 0);
  //vertex(2, 0, 0, 1, 1);
  //vertex(1, 0, 0, 0, 1);

  ////left
  //vertex(1, 1, 0, 0, 0);
  //vertex(1, 1, 1, 1, 0);
  //vertex(1, 0, 1, 1, 1);
  //vertex(1, 0, 0, 0, 1);
  ////right
  //vertex(2, 1, 0, 0, 0);
  //vertex(2, 1, 1, 1, 0);
  //vertex(2, 0, 1, 1, 1);
  //vertex(2, 0, 0, 0, 1);

  //endShape();
  popMatrix();
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

void mouseDragged() {
  rotx += (pmouseY - mouseY)*0.01;
  roty += -(pmouseX - mouseX)*0.01;
}
