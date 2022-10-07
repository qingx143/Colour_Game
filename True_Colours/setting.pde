void setting() {
  background(backgroundColour);
  settingsTitle();
  soundAdjust();
  muteAdjust();
  settingsText();
  main.setGain(volumeMain);
  for (int i = 0; i < soundEffects.length; i++) {
    soundEffects[i].setGain(volumeEffects);
  }
}

//settings title -----------------------------------------------------------------------
void settingsTitle() {
  fill(255);
  textSize(70);
  text("Settings", 300, 75);
}

//settings sound -----------------------------------------------------------------------
void soundAdjust() {
  
  volumeMain = map(sliderX1, 130, 460, -35, 30);
  volumeEffects = map(sliderX2, 130, 460, -35, 30);
  
  noStroke();
  fill(buttonBase);
  rect(300, 190, 500, 100, 30); //bgm
  rect(300, 310, 500, 100, 30); //sfx
  
  strokeWeight(3);
  stroke(255);
  line(130, 210, 460, 210); //bgm
  line(130, 330, 460, 330); //sfx
  
  stroke(backgroundColour);
  tactileSlider(sliderX1, 195, 225);
  circle(sliderX1, 210, 30); //bgm
  stroke(backgroundColour);
  tactileSlider(sliderX2, 315, 345);
  circle(sliderX2, 330, 30); //sfx
  
  //images
  image(muteSet, 80, 210, 25, 25); //bgm
  image(muteSet, 80, 330, 25, 25); //sfx
  image(unmuteSet, 520, 210, 30, 30); //bgm
  image(unmuteSet, 520, 330, 30, 30); //sfx
}

//settings mute ------------------------------------------------------------------------
void muteAdjust() {
  //bgm
  textSize(20);
  strokeWeight(3);
  if (!main.isMuted()) {
    fill(255);
    text("mute", 455, 175);
    noFill();
  }
  else {
    fill(255);
    text("unmute", 455, 175);
    fill(backgroundColour);
  }
  stroke(#659ED6);
  tactileMute(510, 175, 20, 20);
  square(510, 175, 20); 
  
  //sfx
  if (!soundEffects[0].isMuted()) {
    fill(255);
    text("mute", 455, 295);
    noFill();
  }
  else {
    fill(255);
    text("unmute", 455, 295);
    fill(backgroundColour);
  }
  stroke(#659ED6);
  tactileMute(510, 295, 20, 20);
  square(510, 295, 20); 
  
}

//settings text ------------------------------------------------------------------------
void settingsText() {
  fill(255);
  textSize(30);
  text("bgm", 100, 165);
  text("sfx", 90, 285);
}

//tactile slider -----------------------------------------------------------------------
void tactileSlider(float sliderX, float top, float bottom) {
  if (mouseX >= sliderX - 15 && mouseX <= sliderX + 15 && mouseY >= top && mouseY <= bottom) 
    stroke(255);
}

//tactile buttons ----------------------------------------------------------------------
void tactileMute(float x, float y, float w, float h) {
  if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) { 
    stroke(255);
    fill(backgroundColour);
  }
}

//settings clicks ----------------------------------------------------------------------
void settingClicks() {
  //sliders
  if (mouseX >= 130 && mouseX <= 460 && mouseY >= 195 && mouseY <= 225) 
    sliderX1 = mouseX;
  if (mouseX >= 130 && mouseX <= 460 && mouseY >= 315 && mouseY <= 345) {
    soundEffects[1].rewind();
    soundEffects[1].play();
    sliderX2 = mouseX;
  }
  
  //muting
  if (mouseX >= 500 && mouseX <= 520 && mouseY >= 165 && mouseY <= 185) {
    if (main.isMuted())
      main.unmute();
    else
      main.mute();
  }
  if (mouseX >= 500 && mouseX <= 520 && mouseY >= 285 && mouseY <= 305) {
    soundEffects[1].rewind();
    soundEffects[1].play();
    if (soundEffects[1].isMuted())
      for (int i = 0; i < soundEffects.length; i++) {
        soundEffects[i].unmute();
      }
    else
      for (int i = 0; i < soundEffects.length; i++) {
        soundEffects[i].mute();
      }
  }
}

void settingsDrags() {
  //sliders
  if (mouseX >= 130 && mouseX <= 460 && mouseY >= 195 && mouseY <= 225) 
    sliderX1 = mouseX;
  if (mouseX >= 130 && mouseX <= 460 && mouseY >= 315 && mouseY <= 345)
    sliderX2 = mouseX;
}
