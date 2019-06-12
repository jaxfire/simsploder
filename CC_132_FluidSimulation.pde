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

int lifeTime = 2000;

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
  img = loadImage("bath_image.png");
  fluid = new Fluid(0.2, 0, 0.0000001, currentBathBomb);
}

void draw() {
  
  image(img, 0, 0);
  
  if(t < lifeTime) {
  
    // Set the density amount
    float densityAmount = 17.5;
    
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
    float vectorMultiplier = ((lifeTime - t) / 550) * noise(t);
    if(random(1) < 0.30) {
      vectorMultiplier = 0;
    }
      
    v.mult(vectorMultiplier);
  
    fluid.addVelocity(cx, cy, v.x, v.y);
  
    
  } else if(t > lifeTime * 1.25) {
    
    println("New bath bomb");
    
    currentBathBomb = bathBombUtil.getNextBathBomb();
    fluid = new Fluid(0.2, 0, 0.0000001, currentBathBomb);
    t = 0;
  }
  
  t += 1.5;

  fluid.step();
  fluid.renderD();
  fluid.renderV();
  fluid.fadeD();
  
  PFont myFont;
  myFont = createFont("lush_handwritten_bold.otf", 48);
  textFont(myFont);
  fill(0, 0, 0);
  textAlign(CENTER);
  text(currentBathBomb.getName(), N * SCALE / 2, N * SCALE - N / 4);
}
