import java.util.Iterator;

// The responsibilities of this file include:
// 1. All global variables are declared and intialized.
// 2. The draw() method is defined, which is called 60 times per second.

ArrayList<Tile> tiles;
int pixelCount;

void setup() {
    size(800, 800);
    tiles = new ArrayList<Tile>();
    pixelCount = 200;
    //debugStartboardRowOf2s();
    //debugStartboardRightClickShouldDoNothing();
    standardStartboard();
}

void draw() {
    background(150, 150, 150);
    drawEverything();
}
