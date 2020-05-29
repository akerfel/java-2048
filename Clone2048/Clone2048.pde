ArrayList<Tile> tiles;
int pixelCount;
Tile testTile;
Tile testTile2;
Tile testTile3;


void setup() {
    size(800, 800);
    tiles = new ArrayList<Tile>();
    pixelCount = 200;
    testTile = new Tile(2, 2);
    testTile2 = new Tile(1, 1);
    testTile3 = new Tile(1, 2);
    tiles.add(testTile);
    tiles.add(testTile2);
    tiles.add(testTile3);
}

void draw() {
    drawEverything();
}
