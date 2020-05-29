import java.util.Iterator;

ArrayList<Tile> tiles;
int pixelCount;

void setup() {
    size(800, 800);
    tiles = new ArrayList<Tile>();
    pixelCount = 200;
    //debugStartboardRowOf2s();
    debugStartboardRightClickShouldDoNothing();
    //standardStartboard();
}

void draw() {
    background(150, 150, 150);
    drawEverything();
}

void debugStartboardRightClickShouldDoNothing() {
    // add top three rows
    int valueToAdd = 2;
    for (int y = 0; y < 3; y++) {
        for (int x = 0; x < 4; x++) {
            Tile tile = new Tile(x, y);
            tile.value = valueToAdd;
            tiles.add(tile);
            valueToAdd *= 2;
        }
    }
}

void debugStartboardRowOf2s() {
    for (int y = 0; y < 4; y++) {    
        Tile tile = new Tile(0, y);
        tile.value = 2;
        tiles.add(tile);
    }
}

void standardStartboard() {
    createNewTile();
    createNewTile();
}

// unintended behavior atm: if you click but no tiles can move, a new tile will still be added.
// This should not be the case. If no tiles can move, no new tile should be created.
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

void actionsAfterClick() {
    if (tiles.size() < 16) {
        createNewTile();
    }
    updateCreationStatus();
}

void updateCreationStatus() {
    for (Tile tile : tiles) {
        tile.wasCreatedByMergeThisTurn = false;
    }
}

void upClicked() {
    for (int y = 0; y < 4; y++) {
        for (int x = 0; x < 4; x++) {
            moveTileIfHasCoords(x, y, 0, -1);
        }
    }
    actionsAfterClick();
}

void downClicked() {
    for (int y = 3; y >= 0; y--) {
        for (int x = 0; x < 4; x++) {
            moveTileIfHasCoords(x, y, 0, 1);
        }
    }
    actionsAfterClick();
}

void rightClicked() {
    for (int x = 3; x >= 0; x--) {
        for (int y = 0; y < 4; y++) {
            moveTileIfHasCoords(x, y, 1, 0);
        }
    }
    actionsAfterClick();
}

void leftClicked() {
    for (int x = 0; x < 4; x++) {
        for (int y = 0; y < 4; y++) {
            moveTileIfHasCoords(x, y, -1, 0);
        }
    }
    actionsAfterClick();
}

void moveTileIfHasCoords(int x, int y, int xdir, int ydir) {
    for (Tile tile : tiles) {
        if (tile.x == x && tile.y == y && !tile.wasCreatedByMergeThisTurn) {
            moveTile(tile, xdir, ydir);   
            return;
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
        if (!mergeIfMatchingTile(tile, new_x, new_y)) {
            if (noTileOn(new_x, new_y) && new_x >= 0 && new_x <= 3 && new_y >= 0 && new_y <= 3) {
                tile.x += xdir;
                tile.y += ydir;
            }
            else {
                break;    
            }
        }
    }
}

// Will merge tile1 with tile2 on (x, y) if they have the same value.
// Returns true if merge successful.
boolean mergeIfMatchingTile(Tile tile1, int x, int y) {
    Iterator<Tile> it = tiles.iterator();
    while (it.hasNext()) {
        Tile tile2 = it.next();
        if (tile1.value == tile2.value && !tile1.wasCreatedByMergeThisTurn && x == tile2.x && y == tile2.y) {
            it.remove();
            tile1.x = x;
            tile1.y = y;
            tile1.value *= 2;
            tile1.wasCreatedByMergeThisTurn = true;
            return true;
        }
    }
    return false;
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
