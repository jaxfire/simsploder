class BathBombUtil {
  
  int index;
  private BathBomb[] bathBombs;
  
  public BathBombUtil() {
    
    index = 0;
        
    bathBombs = new BathBomb[9];
    
    String[] names = new String[] {
      "Melusine", "Groovy Kind Of Love", "Hulder", "Goddess", "Lemon Butterfly", "Harajuku", "Kitsune", "The Expermienter", "Geode", "Marshmallow World", "Sushi"
    };
    
    color[][] colors = new color[][] {
      new color[]{color(168, 189, 139), color(174, 194, 147), color(56, 114, 67), color(103, 146, 100), color(164, 180, 91), color(199, 222, 210),
    color(139, 133, 42), color(222, 220, 168), color(129, 145, 100), color(208, 228, 175), color(87, 106, 69), color(202, 216, 193)}, // Melusine
      new color[]{color(248,190,96), color(235,182,144), color(175,114,176), color(112,175,202), color(249,248,248), color(224, 138, 143)}, // Groovy Kind of Love
      new color[]{color(193,209,177), color(220,192,234), color(89,159,81), color(98, 78, 151), color(62,128,65), color(239, 254, 207)}, // Hulder
      new color[]{color(204,132,228), color(192,167,223), color(136,93,177), color(159,125,199), color(247,246,250), color(228, 73, 231)}, // Goddess 
      new color[]{color(41,160,145), color(204,203,83), color(232,233,233), color(136,186,149), color(202,205,138), color(63, 143, 89)}, // Lemon Butterfly
      new color[]{color(252,148,228), color(241,126,186), color(231,173,99), color(248,248,247), color(218,188,158), color(211, 134, 48)}, // Harajuku
      new color[]{color(222,187,139), color(206,176,132), color(166,131,90), color(211,205,199), color(204,193,181), color(229, 188, 107)}, // Kitsune
      new color[]{color(198, 54, 142), color(91, 178, 60), color(69, 160, 205), color(224, 175, 183),color(239, 215, 158), color(94, 39, 125)}, // The Experimenter
      new color[]{color(98,176,207), color(225,196,168), color(84,81,123), color(127,99,129), color(171,141,119), color(234, 150,  82)}, // Geode
      new color[]{color(249,186,229), color(227,179,46), color(135,98,150), color(235,160,209), color(249,247,247), color(199, 79, 138)}, // Marshmallow World
      new color[]{color(242,148,105), color(238,117,65), color(75,82,86), color(244,245,244), color(161,166,168), color(239, 254, 207)} // Sushi
    };
    
    for(int i = 0; i < bathBombs.length; i++) {
      bathBombs[i] = new BathBomb(names[i], colors[i]); 
    }
  }
  
  public BathBomb getNextBathBomb() {
    BathBomb result = bathBombs[index % bathBombs.length];
    index++;
    return result;
  }
}
