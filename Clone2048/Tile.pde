public class Tile {
    int value;
    int x;    // 0 to 3
    int y;    // 0 to 3
    boolean wasCreatedThisTurn;
    
    public Tile(int x, int y) {
        randomizeValue();
        this.x = x;
        this.y = y;
        wasCreatedThisTurn = true;
    }
    
    // Alternate constructor. Specify wasCreatedThisTurn.
    public Tile(int x, int y, boolean wasCreatedThisTurn) {
        randomizeValue();
        this.x = x;
        this.y = y;
        this.wasCreatedThisTurn = wasCreatedThisTurn;
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
