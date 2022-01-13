float rotx, roty;

void setup() {
  size(1400, 800, P3D);
}


void draw() {
  background(255);
  cube(width/2, height/2, 0, #ffffff, 200);
  cube(width/1.25, height/1.25, 0, #dddddd, 100);
  sphere(width/1.5, height/1.5, 0, #ffffff, 200);
}

void cube(float x, float y, float z, color c, float size) {
  pushMatrix();
  translate(x, y, z);

  rotateX(rotx);
  rotateY(roty);
  fill(c);
  stroke(0);
  strokeWeight(3);
  box(size);
  box(size-50);
  popMatrix();
}

void sphere(float x, float y, float z, color c, float size) {
  pushMatrix();
  translate(x, y, z);

  rotateX(rotx);
  rotateY(roty);
  fill(c);
  stroke(0);
  strokeWeight(3);
  sphere(size);
  sphere(size-50);
  popMatrix();
}

void mouseDragged() {
  rotx += (pmouseY - mouseY)*0.01;
  roty += -(pmouseX - mouseX)*0.01;
}
