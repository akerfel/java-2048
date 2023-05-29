public class Tile {
    int value;
    int x;    // 0 to 3
    int y;    // 0 to 3
    boolean wasCreatedByMergeThisTurn;

    public Tile(int x, int y) {
        randomizeValue();
        this.x = x;
        this.y = y;
        wasCreatedByMergeThisTurn = false;
    }

    public void randomizeValue() {
        if (random(1) < 0.1) {
            value = 4;
        } else {
            value = 2;
        }
    }
}
