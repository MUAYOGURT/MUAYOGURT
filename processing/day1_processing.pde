void setup() {
  size(800,800);
}

void draw() {
  background(255);
  smooth();
noFill();
for (int i = 0; i < 100; i++) {
  for (int x = 0; x < 1000 ;x += 100) {
    for (int y = 0; y < 1000; y += 100) {
      stroke(random(255), random(255), 255);
      strokeWeight(4);
      ellipse(x, y, i, i);
    }
  }
}
}