void game() {
  background(backgroundColour);
  stroke(255);
  line(300, -10, 300, 410);
  
  fill(255);
  textSize(25);
  text("score = " + score, 525, 375);
  matchOptions();
  word();
  keyChoice();
  timer();
}

//match options ------------------------------------------------------------------------
void matchOptions() {
  noStroke();
  buttons(175, 200, 200, 100, 5, buttonBase);
  noStroke();
  buttons(425, 200, 200, 100, 5, buttonBase);
  
  fill(255);
  textSize(35);
  text("NO MATCH", 175, 195);
  text("MATCH", 425, 195);
}

//words --------------------------------------------------------------------------------
void word() {
  pushMatrix();
  translate(300, 200);
  if (wordSize == 1)
    randomGen();
  fill(colours[randomColour]);
  textSize(wordSize);
  text(words[randomWord], 0, 0);
  
  if (wordSize <= 200) 
    wordSize++;
  if (wordSize == 200)
    mode = GAMEOVER;
  
  popMatrix();
}

//random number generator --------------------------------------------------------------
void randomGen() {
  randomChance = (int) random(0, 2); //0 = true, 1 = false
  randomWord = (int) random(0, 7);
  if (randomChance == 0) {
    randomColour = randomWord;
    wordMatch = 1;
  }
  else if (randomChance == 1) {
    while(randomColour == randomWord) {
      randomColour = (int) random (0, 7);
    }
    wordMatch = 2;
  }
}

//decision -----------------------------------------------------------------------------
void decision(float x, float y, float w, float h, int choice) {
  if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) 
    rightOrWrong(choice);
}

//decision2 -----------------------------------------------------------------------------
void keyChoice() {
  if (rightkey) { //right
    rightOrWrong(1);
    rightkey = false;
  }
  else if (leftkey) { //wrong
    rightOrWrong(2);
    leftkey = false;
  }
}

void rightOrWrong(int guess) {
  if (wordMatch == guess) {
      soundEffects[1].rewind();
      soundEffects[1].play();
      score++;
      wordSize = 1;
  }
  else if (wordMatch != guess) {
    wordSize = 1;
    soundEffects[0].rewind();
    soundEffects[0].play();
    mode = GAMEOVER;
  }
}

//timer --------------------------------------------------------------------------------
void timer() {
  fill(255);
  textSize(25);
  text(wordSize / 10, 25, 375);
}

//game clicks --------------------------------------------------------------------------
void gameClicks() {
  decision(175, 200, 200, 100, 2);
  decision(425, 200, 200, 100, 1);
}
