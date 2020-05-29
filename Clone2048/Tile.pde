public class Tile {
    int value;
    int x;    // 1 to 4
    int y;    // 1 to 4
    
    public Tile(int x, int y) {
        randomizeValue();
        this.x = x;
        this.y = y;
    }
    
    public void randomizeValue() {
        if (random(1) < 0.1) {
            value = 4;    
        }
        else {
            value = 2;    
        }
    }
}
