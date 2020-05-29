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
    println("pos: " + testTile.y);
}

void upClicked() {
    for (int y = 0; y < 4; y++) {
        for (int x = 0; x < 4; x++) {
            for (Tile tile : tiles) {
                if (tile.x == x && tile.y == y) {
                    moveTile(tile, 0, -1);    
                }
            }
        }
    }
}

void downClicked() {
    for (int y = 3; y >= 0; y--) {
        for (int x = 0; x < 4; x++) {
            for (Tile tile : tiles) {
                if (tile.x == x && tile.y == y) {
                    moveTile(tile, 0, 1);    
                }
            }
        }
    }
}

void rightClicked() {
    for (int x = 3; x >= 0; x--) {
        for (int y = 0; y < 4; y++) {
            for (Tile tile : tiles) {
                if (tile.x == x && tile.y == y) {
                    moveTile(tile, 1, 0);    
                }
            }
        }
    }
}

void leftClicked() {
    for (int x = 0; x < 4; x++) {
        for (int y = 0; y < 4; y++) {
            for (Tile tile : tiles) {
                if (tile.x == x && tile.y == y) {
                    moveTile(tile, -1, 0);    
                }
            }
        }
    }
}

// Takes arguments: tile to move, and xdir and ydir as a direction.
// Example: moveTile(tile, 0, -1) will move tile upwards until it meets another tile or a wall.
// Only use 0, 1 or -1 as arguments. (At least one must be 1 though)
void moveTile(Tile tile, int xdir, int ydir) {
    if (xdir != 1 || ydir != 1 || (xdir == 1 && ydir == 1)) {
        println("ERROR INPUT for function moveTile");  
    }
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
