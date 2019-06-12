public class BathBomb {
  
  private String name;
  private color[] colours = new color[5];
  
  public BathBomb(String name, color[]  colours) {
    this.name = name;
    this.colours = colours;
  }
  
  public String getName() {
    return name; 
  }
  
  public color getColour(int index) {
    return colours[index];
  }
} 
