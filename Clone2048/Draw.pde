void drawEverything() {
    drawTiles();
}

void drawTiles() {
    for (Tile t : tiles) {
        int xpixel = t.x * pixelCount;
        int ypixel = t.y * pixelCount;
        fill(0xF2, 0xB1, 0x79);
        rect(xpixel, ypixel, pixelCount, pixelCount);
        
        // draw text value
        textSize(40);
        textAlign(CENTER, CENTER);
        fill(255, 255, 255);
        text(t.value, xpixel + pixelCount/2, ypixel + pixelCount/2);
    }
    
}
