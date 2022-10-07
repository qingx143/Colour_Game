void intro() {
  background(backgroundColour);
  fill(255);
  textSize(70);
  text("True Colours", 300, 125);
  introButtons();
  introGif();
}

//buttons ------------------------------------------------------------------------------
void introButtons() {
  noStroke();
  buttons(190, 250, 200, 75, 5, buttonBase);
  fill(255);
  textSize(50);
  text("play", 190, 240);
}

//intro gif ----------------------------------------------------------------------------
void introGif() {
  image(bongoGif[imageSpeed], 440, 280, 250, 250);
  if (frameCount % 15 == 0) imageSpeed++;
  if (imageSpeed == bongoGif.length) imageSpeed = 0;
}

//intro clicks -------------------------------------------------------------------------
void introClicks() {
  changeRect(250, 250, 200, 75, GAME);
}
