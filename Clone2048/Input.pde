void keyPressed() {
    if (key == CODED) {
        if (keyCode == UP) {
            upClicked();
        }
        if (keyCode == DOWN) {
            downClicked();
        }
        if (keyCode == LEFT) {
            leftClicked();
        }
        if (keyCode == RIGHT) {
            rightClicked();
        }
    }
}
