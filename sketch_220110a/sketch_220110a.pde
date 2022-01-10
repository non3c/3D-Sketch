float rotx, roty;

void setup(){
  size(1400, 800, P3D); 
}


void draw(){
  background(255);
  translate(width/2, height/2, 0);
  noFill();
  stroke(0);
  strokeWeight(3);
  rotateX(rotx);
  rotateY(roty);
  box(200, 200, 200);
  rotateX(rotx);
  rotateY(roty);
  box(150, 150, 150);
  fill(#dddddd, 20);
  sphere(50);
  
}

void mouseDragged() {
 rotx += (pmouseY - mouseY)*0.01;
 roty += -(pmouseX - mouseX)*0.01;
  
  
}
