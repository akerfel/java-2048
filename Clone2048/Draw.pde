void drawEverything() {
    drawTiles();
}

void drawTiles() {
    for (Tile t : tiles) {
        drawTile(t);
    }
}

void drawTile(Tile t) {
    // draw box
    int offset = 2;
    int xpixel = t.x * pixelCount + offset;
    int ypixel = t.y * pixelCount + 2;
    fill(0xF2, 0xB1, 0x79);
    rect(xpixel, ypixel, pixelCount - offset, pixelCount - offset);

    // draw text value
    textSize(60);
    textAlign(CENTER, CENTER);
    fill(255, 255, 255);
    text(t.value, xpixel + pixelCount/2 - offset, ypixel + pixelCount/2 - offset);
}
