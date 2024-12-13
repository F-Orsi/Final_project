class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration1;
  PVector acceleration2;
  PVector acceleration3;
  PImage img;
  
  float topspeed;
  
  Mover() {
    img = loadImage("time-06.png");
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    acceleration1 = new PVector(0,0);
     acceleration2 = new PVector(0,0);
    topspeed = 10;
  }
   
  void update() {
     /*PVector mouse = new PVector(mouseX,mouseY);
     PVector dir = PVector.add(mouse,location);
     
     PVector delta = new PVector(location.x, location.y);
     delta.sub(mouse);
     float d = delta.mag();
     //if (d > 100) d = 100;
     println(d);
     
     dir.normalize();
     dir.mult(-1.0);
     
     acceleration1 = dir;
    
     acceleration2.rotate(radians(random(-100 , 100)));
     float newX = ((acceleration1.x * (100 -d)) + (acceleration2.x * d)) / d;
     float newY = ((acceleration1.y * (100 -d)) + (acceleration2.y * d)) / d;  
     acceleration3 = new PVector(newX, newY);
     
    velocity.add(acceleration3);
    velocity.limit(topspeed);
    location.add(velocity);*/
    
    // Detect mouse movement
  mouseMoved = (mouseX != prevMouse.x || mouseY != prevMouse.y);

  if (!mouseMoved) {
    // If the mouse hasn't moved, keep the object stationary
    velocity.set(0, 0); // Stop any velocity
    return;
  }

  // Update the previous mouse position
  prevMouse.set(mouseX, mouseY);

  // Vector pointing away from the mouse
  PVector mouse = new PVector(mouseX, mouseY);
  PVector dir = PVector.sub(location, mouse); // Corrected direction: location - mouse

  float d = dir.mag(); // Distance between mouse and object
  d = constrain(d, 5, 200); // Clamp distance to avoid extreme behavior

  // Normalize direction and scale by a factor inversely proportional to distance
  dir.normalize();
  dir.mult(map(d, 5, 200, topspeed, 2)); // Stronger repulsion when closer

  // Apply random jitter for unpredictability
  PVector jitter = PVector.random2D();
  jitter.mult(0.5); // Control randomness intensity

  acceleration1 = dir;
  acceleration2 = jitter;

  // Final acceleration combines repulsion and jitter
  acceleration3 = PVector.add(acceleration1, acceleration2);

  // Update velocity and location
  velocity.add(acceleration3);
  velocity.limit(topspeed);
  location.add(velocity);
  }

  void display() {
    imageMode(CENTER);
    image(this.img,location.x,location.y);
  }
 
      void checkEdges() {
   /*if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
     
      velocity.y *= -1;
      location.y = height;
    }*/
    
    
    float maxW = width - this.img.width;
    float maxH = height - this.img.height;
    if (location.x > maxW) location.x = maxW;
    if (location.x < this.img.width) location.x = this.img.width;
    
    if (location.y > maxH) location.y = maxH;
    if (location.y < this.img.height) location.y = this.img.height;
  }
}
