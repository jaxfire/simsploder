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
BathBombUtil bathBombUtil;

PImage img;

void settings() {
  size(N*SCALE, N*SCALE);
}

void setup() {
  
  bathBombUtil = new BathBombUtil();
  img = loadImage("bath_image.png");
  fluid = new Fluid(0.2, 0, 0.00000001, bathBombUtil.getBathBomb(4));
}

void draw() {
  
  image(img, 0, 0);
  
  // Set the density amount
  float densityAmount = 10;
  
  int cx = int(0.5*width/SCALE);
  int cy = int(0.5*height/SCALE);
  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      fluid.addDensity(cx+i, cy+j, densityAmount);
    }
  }
  
  // Replicate vectors from all directions from a circle.
  float angle = (t % 18) * 5;
  PVector v = PVector.fromAngle(angle);
  
  // Set the vector amount
  float vectorMultiplier = 0.8;
  v.mult(vectorMultiplier);

  fluid.addVelocity(cx, cy, v.x, v.y);

  t += 0.2;

  fluid.step();
  fluid.renderD();
  fluid.renderV();
  fluid.fadeD();
}
