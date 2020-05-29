ArrayList<Tile> tiles;
int pixelCount;
Tile testTile;

void setup() {
    size(800, 800);
    tiles = new ArrayList<Tile>();
    pixelCount = 200;
    testTile = new Tile(2, 2);
    tiles.add(testTile);
    
}

void draw() {
    drawEverything();
}
