public class BathBomb {
  
  private String name;
  private color[] colours;
  private int[] randomColourOrder;
  
  public BathBomb(String name, color[]  colours) {
    this.name = name;
    this.colours = colours;
    this.randomColourOrder = new int[colours.length];
    for (int i = 0; i < randomColourOrder.length; i++) {
      randomColourOrder[i] = i;
    }
  }
  
  public String getName() {
    return name; 
  }
  
  public int getNumOfColours() {
    return colours.length; 
  }
  
  public color getColour(int index) {
    return colours[index];
  }
  
  public void randomiseColours() {
    shuffleArray(randomColourOrder);
  }
  
  // Fisher–Yates shuffle
  void shuffleArray(int[] ar) {
    
    for (int i = ar.length - 1; i > 0; i--) {
      int index = (int)random(i + 1);
      int a = ar[index];
      ar[index] = ar[i];
      ar[i] = a;
    }
  }
} 
