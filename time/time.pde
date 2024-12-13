PImage img;
Mover mover;
 PVector prevMouse; // To track the previous mouse position
  boolean mouseMoved = false; // To detect mouse movement

void setup() {
  size(1920,1080, P3D);
  img = loadImage("time_bg-04.jpg");
  mover = new Mover();
  prevMouse = new PVector(mouseX, mouseY);
}

void draw() {
  //background(155);
  imageMode(CORNER);
  image(img, 0, 0, width, height);
  
  mover.update();
  mover.checkEdges();
  mover.display();
}
  
