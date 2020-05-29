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
    background(150, 150, 150);
    drawEverything();
}

void createNewTile() {
    boolean tileAdded = false;
    while (!tileAdded) {
        int x = int(random(0, 4)); 
        int y = int(random(0, 4));  
        // check that no tile already has those coordinates
        boolean spaceIsFree = true;
        for (Tile tile : tiles) {
            if (tile.x == x && tile.y == y) {
                spaceIsFree = false;
                break;
            }
        }
        if (spaceIsFree) {
            tiles.add(new Tile(x, y));
            tileAdded = true;
        }
    }
}

void upClicked() {
    for (int y = 0; y < 4; y++) {
        for (int x = 0; x < 4; x++) {
            moveTileIfHasCoords(x, y, 0, -1);
        }
    }
    createNewTile();
}

void downClicked() {
    for (int y = 3; y >= 0; y--) {
        for (int x = 0; x < 4; x++) {
            moveTileIfHasCoords(x, y, 0, 1);
        }
    }
    createNewTile();
}

void rightClicked() {
    for (int x = 3; x >= 0; x--) {
        for (int y = 0; y < 4; y++) {
            moveTileIfHasCoords(x, y, 1, 0);
        }
    }
    createNewTile();
}

void leftClicked() {
    for (int x = 0; x < 4; x++) {
        for (int y = 0; y < 4; y++) {
            moveTileIfHasCoords(x, y, -1, 0);
        }
    }
    createNewTile();
}

void moveTileIfHasCoords(int x, int y, int xdir, int ydir) {
    for (Tile tile : tiles) {
        if (tile.x == x && tile.y == y) {
            moveTile(tile, xdir, ydir);    
        }
    }
}

// Takes arguments: tile to move, and xdir and ydir as a direction.
// Example: moveTile(tile, 0, -1) will move tile upwards until it meets another tile or a wall.
// Exactly one of xdir and ydir must be 1 (or -1). The other one must be 0.
void moveTile(Tile tile, int xdir, int ydir) {
    while(true) {
        int new_x = tile.x + xdir;
        int new_y = tile.y + ydir;
        if (noTileOn(new_x, new_y) && new_x >= 0 && new_x <= 3 && new_y >= 0 && new_y <= 3) {
            tile.x += xdir;
            tile.y += ydir;
        }
        else {
            break;    
        }
    }
}

// returns true if there is on tile with position (x, y)
boolean noTileOn(int x, int y) {
    for (Tile tile : tiles) {
        if (tile.x == x && tile.y == y) {
            return false;  
        }
    }
    return true;
}
