PImage img;  // Image to load
PImage mouseImg; // Image that follows the cursor

int py = 0;  // Pixel y-coordinate

void setup() {
  size(600, 600); // Try some different sizes
  //fullScreen();

  // Control the frame rate of the code
  frameRate(60);

  // Load the image to read, the image must be
  // in your "data" folder inside the sketch folder
  img = loadImage("rgb space.png");
  mouseImg = loadImage("alien sticker.png");
}

void draw() {
  background(0);

  for (int x = 0; x < img.width; x = x + 1) {
    color c = img.get(x, py);
    stroke(c);
    line(x, 0, x, height);
  }

  // Move the color location
  py = py + 1;
  if (py >= img.height) {
    py = 0;
  }

  if (keyPressed && key == ' ') {
    // Display image
    image(img, 0, 0);
    // Draw cross to show color location
    stroke(0, 0, 255);
    line(0, py, width, py);
  }
  
  for (int i = 0; i < 25; i++){
    noStroke();
    circle(random(width), random(height), random(1, 25));
    star(random(width), random(height), random(1, 10), random(1, 10), 5);
  }
  
  
  
  image(mouseImg, mouseX, mouseY, 200, 200); // This is the image attached to cursor
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
