PVector here1, there1, here2, there2;
float progress;
float increment = 0.05f;

void setup() {
  size(displayWidth, displayHeight, P3D);
  camera();
  here1 = new PVector(width/2, height/2, -1000);
  here2 = new PVector(width/2, height/2, -1000);
  there1 = here1;
  there2 = here2;
  progress = 0f;
  background(128);
  textSize(14);

  strokeCap(ROUND);
  strokeWeight(6f);
  smooth(8);
}

void draw() {
  if (progress == 0f) {
    here1 = there1;
    here2 = there2;
    there1 = new PVector(random(here1.x-width/8, here1.x+width/8), random(here1.y-height/8, here1.y+height/8), random(here1.z-200, here1.z+200));
    there2 = new PVector(random(here2.x-width/8, here2.x+width/8), random(here2.y-height/8, here2.y+height/8), random(here2.z-200, here2.z+200));

    pushMatrix();
    translate(0, 0, (here1.z));

    float r = (-1000+here1.z)/60;

    pushStyle();
    noStroke();
    fill(lerpColor(color(100, 80, 80, 50), color(180, 80, 80, 50), map(there1.z, -2000, 0, 0, 1)));
    ellipse(here1.x, here1.y, r, r);
    popStyle();
    pushStyle(); 
    stroke(color(20, 20, 20, 60));
    strokeWeight(2f);
    if (keyPressed && key =='t') text("("+here1.z+")", here1.x+r+10, here1.y-r);
    popMatrix();
    popStyle();


    pushMatrix();
    translate(0, 0, (here2.z));



    r = (-1000+here2.z)/60;
    pushStyle();
    noStroke();
    fill(lerpColor(color(100, 80, 80, 50), color(180, 80, 80, 50), map(there2.z, -2000, 0, 0, 1)));
    ellipse(here2.x, here2.y, r, r);
    popStyle();

    pushStyle(); 
    stroke(color(20, 20, 20, 60));
    strokeWeight(2f);
    if (keyPressed && key =='t') text("("+here2.z+")", here2.x+r+10, here2.y-r);
    popMatrix();
    popStyle();
  }
  float t = progress;
  float v = progress+increment;
  color c1 = lerpColor(color(50, 0, 0, 200), color(180, 80, 80, 200), (2000+there1.z)/2000f);
  color c2 = lerpColor(color(0, 30, 0, 200), color(60, 160, 60, 200), (2000+there2.z)/2000f);

  stroke(c1);      
  line((1-t)*(here1.x)+t*(there1.x), 
  (1-t)*(here1.y)+t*(there1.y), 
  (1-t)*(here1.z)+t*(there1.z), 
  (1-v)*(here1.x)+v*(there1.x), 
  (1-v)*(here1.y)+v*(there1.y), 
  (1-v)*(here1.z)+v*(there1.z));

  stroke(c2);      
  line((1-t)*(here2.x)+t*(there2.x), 
  (1-t)*(here2.y)+t*(there2.y), 
  (1-t)*(here2.z)+t*(there2.z), 
  (1-v)*(here2.x)+v*(there2.x), 
  (1-v)*(here2.y)+v*(there2.y), 
  (1-v)*(here2.z)+v*(there2.z));

  progress += increment;
  if (progress>1) progress=0;
}

