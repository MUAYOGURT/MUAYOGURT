void setup() {
  size(500,500);  

}

void draw() {
  background(249,194,112);

  fill(242);
  
 
  pushMatrix();  
   
  translate(150,150);
  fill(242,155,135);
  ellipse(0,0, 250,250);
  fill(248,198,181);
 

  rotate(radians(frameCount)*-3);

  for(float i=0; i<12; i++) {
    beginShape();
  vertex(130, 60);
  bezierVertex(250, 70, 210, 200, 130, 200);
 bezierVertex(150, 190, 200, 115, 130, 60);
 endShape();
    rotate(radians(30));
  }
 
  popMatrix();  


  fill(248);
  pushMatrix();  

  translate(mouseX,mouseY);
  ellipse(0,0, 100,100);

  rotate(radians(frameCount)*2);
  for(float i=0; i<12; i++) {
    ellipse(50,0, 50,50);
    rotate(radians(10));
  }
  
  popMatrix();  
  fill(243,152,57);
  triangle(100, 100, 200, 100, mouseX, mouseY);
}