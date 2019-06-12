class BathBombUtil {
  
  int index;
  private BathBomb[] bathBombs;
  
  public BathBombUtil() {
    
    index = 0;
        
    bathBombs = new BathBomb[9];
    
    String[] names = new String[] {
      "Black Rose", "Geode", "Groovy Kind Of Love", "Harajuku", "Goddess", "Kitsune", "Lemon Butterfly", "Marshmallow World", "Sushi"
    };
    
    color[][] colors = new color[][] {
      new color[]{color(200,161,163), color(170,116,132), color(87,81,83), color(130,101,103), color(135,126,128)},
      new color[]{color(98,176,207), color(225,196,168), color(84,81,123), color(127,99,129), color(171,141,119)},
      new color[]{color(248,190,96), color(235,182,144), color(175,114,176), color(112,175,202), color(249,248,248)},
      new color[]{color(252,148,228), color(241,126,186), color(231,173,99), color(248,248,247), color(218,188,158)},
      new color[]{color(204,132,228), color(192,167,223), color(136,93,177), color(159,125,199), color(247,246,250)},
      new color[]{color(222,187,139), color(206,176,132), color(166,131,90), color(211,205,199), color(204,193,181)},
      new color[]{color(41,160,145), color(204,203,83), color(232,233,233), color(136,186,149), color(202,205,138)},
      new color[]{color(249,186,229), color(227,179,46), color(135,98,150), color(235,160,209), color(249,247,247)},
      new color[]{color(242,148,105), color(238,117,65), color(75,82,86), color(244,245,244), color(161,166,168)}
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
