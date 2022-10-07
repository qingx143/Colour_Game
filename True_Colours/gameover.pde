void gameover() {
  background(backgroundColour);
  if (score >= highscore) {
    highscore = score;
    lose = false;
  }
  else
    lose = true;
  fill(255);
  textSize(70);
  text("GAMEOVER", 300, 75);
  textSize(25);
  text("score = " + score, 300, 40);
  gameoverCat();
  gameoverButtons();
}

//gameover cat -------------------------------------------------------------------------
void gameoverCat() {
  if (lose)
    image(sadBongo, 400, 200, 150, 150);
  else
    image(happyBongo, 400, 200, 150, 150);
  fill(255);
  textSize(18);
  if (lose) {
    text("Oh no, you didn't beat", 200, 150);
    text("your highscore of " + highscore + "!", 200, 170);
  }
  else {
    text("Congrats! Your", 200, 150);
    text("highscore is now " + highscore + "!", 200, 170);
  }
  strokeWeight(2);
  stroke(255);
  line(295, 170, 325, 180);
  strokeWeight(3);
}

//gameover buttons ---------------------------------------------------------------------
void gameoverButtons() {
  noStroke();
  buttons(300, 300, 300, 75, 5, buttonBase); //try again
  noStroke();
  buttons(540, 370, 90, 35, 2, buttonBase); //exit
  
  fill(255);
  textSize(45);
  text("try again", 300, 290);
  textSize(25);
  text("exit", 540, 365);
}

//gameover clicks ----------------------------------------------------------------------
void gameoverClicks() {
  changeRectIntro(300, 300, 300, 75);
  if (mouseX >= 495 && mouseX <= 585 && mouseY >= 352.5 && mouseY <= 387.5)
    exit();
  
}
