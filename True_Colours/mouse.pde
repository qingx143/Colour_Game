void mouseReleased() {
  if (mode == INTRO) 
    introClicks();
  else if (mode == SETTING) 
    settingClicks();
  else if (mode == INSTRUCTIONS)
    instructionsClicks();
  else if (mode == GAME) 
    gameClicks();
  else if (mode == GAMEOVER) 
    gameoverClicks();
    
  if (dropdown) {
    changeRect2(40, 100, 35, 35, INSTRUCTIONS);
    changeRect(40, 190, 35, 35, SETTING);
    if (mouseX >= 25 && mouseX <= 55 && mouseY >= 130 && mouseY <= 160) {
      if (main.isMuted())
        main.unmute();
      else
        main.mute();
    }
  }
  
  changeRectIntro(560, 40, 50, 50);
}

void mouseDragged() {
  if (mode == SETTING)
    settingsDrags();
}
