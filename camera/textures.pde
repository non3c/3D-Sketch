
void texturedBlock(int x, int y, int z, PImage tex, float size) {
  pushMatrix();
  translate(x,y,z);
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
  translate(x,y,z);
  scale(size);
  noStroke();
  
  beginShape(QUADS);
  texture(top);
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

void drawGround() {
  noLoop();
  int x = -20, y = -20;
  while (x <= 20) {
    //blocks(x, 2, y, netheriteblock);
    x = x + 1;
    if (x >= 20) {
      y = y + 1;
      x = -20;
    }
    if (y >= 20) break;
  }
}
