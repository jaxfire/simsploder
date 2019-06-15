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
float t = 1;

int lifeTime = 2250;

  PFont myFont;

Fluid fluid;
BathBombUtil bathBombUtil;
BathBomb currentBathBomb;

PImage img;

void settings() {
  size(N*SCALE, N*SCALE);
}

void setup() {
  
  bathBombUtil = new BathBombUtil();
  currentBathBomb = bathBombUtil.getNextBathBomb();
  myFont = createFont("lush_handwritten_bold.otf", 32);
  fluid = new Fluid(0.2, 0, 0.0000001, currentBathBomb);
}

void draw() {
  background(255);
  
  if(t < lifeTime) {
  
    // Set the density amount
    float densityAmount = 15;
    
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
    float vectorMultiplier = ((lifeTime - t * 0.75) / 550) * max(0.1, noise(t));
    
    float drasticModifier = random(1);
    if(drasticModifier < 0.55) {
      vectorMultiplier = 0;
    } else if(drasticModifier > 0.95) {
      vectorMultiplier *= 2;
    }
      
    v.mult(vectorMultiplier);
  
    fluid.addVelocity(cx, cy, v.x, v.y);
  
    
  } else if(t > lifeTime * 1.20) {
    
    reset();
    currentBathBomb.randomiseColours();
  }
  
  t += 1.5;

  fluid.step();
  fluid.renderD();
  fluid.renderV();
  fluid.fadeD();
  
  textFont(myFont);
  fill(0, 0, 0);
  textAlign(CENTER);
  text(currentBathBomb.getName(), N * SCALE / 2, N * SCALE - N / 4);
}

void reset() {
    currentBathBomb = bathBombUtil.getNextBathBomb();
    fluid = new Fluid(0.2, 0, 0.0000001, currentBathBomb);
    t = 0;
}
