// Fluid Simulation
// Daniel Shiffman
// https://thecodingtrain.com/CodingChallenges/132-fluid-simulation.html
// https://youtu.be/alhpH6ECFvQ

// This would not be possible without:
// Real-Time Fluid Dynamics for Games by Jos Stam
// http://www.dgp.toronto.edu/people/stam/reality/Research/pdf/GDC03.pdf
// Fluid Simulation for Dummies by Mike Ash
// https://mikeash.com/pyblog/fluid-simulation-for-dummies.html

final int N = 128;
final int iter = 16;
final int SCALE = 4;
float t = 0;

Fluid fluid;

PImage img;

void settings() {
  size(N*SCALE, N*SCALE);
}

void setup() {
  img = loadImage("bath_image.png");
  fluid = new Fluid(0.2, 0, 0.00000001);
  
}

void draw() {
  
  image(img, 0, 0);
  
  println(t);
  
  int cx = int(0.5*width/SCALE);
  int cy = int(0.5*height/SCALE);
  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      fluid.addDensity(cx+i, cy+j, random(0, 100));
    }
  }
  
  float vectorMultiplier = noise(t) / random(1, 10);
  for (int i = 0; i < 4; i++) {
    float angle = noise(t) * TWO_PI * 10;
    PVector v = PVector.fromAngle(angle + i * random(60));
    v.mult(vectorMultiplier);
    t += 0.1;
    fluid.addVelocity(cx, cy, v.x, v.y);
  }

  fluid.step();
  fluid.renderD();
  fluid.renderV();
  fluid.fadeD();
}
