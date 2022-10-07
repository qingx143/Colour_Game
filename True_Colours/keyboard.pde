void keyReleased() { 
  if (mode == GAME) {
    if (keyCode == LEFT) 
      leftkey = true;
    if (keyCode == RIGHT) 
      rightkey = true;
  }
}
