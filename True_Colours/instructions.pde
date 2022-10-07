void instructions() {
  background(backgroundColour);
  fill(255);
  textSize(40);
  text("GAME CONTROLS:", 300, 40);
  
  textSize(20);
  rects(80, 104, 108, 20, #719BC4); //true colours
  text("True Colours is a fun game that tests your colour matching ability!", 300, 100);
  
  rects(363, 154, 75, 20, #719BC4); //matches
  rects(320, 179, 70, 20, #719BC4); //match
  text("If the given colour of the word matches the word itself,", 300, 150);
  text("press on the \"MATCH\" button.", 300, 175);
  
  rects(297, 213, 65, 20, #719BC4); //do not
  rects(496, 213, 103, 20, #719BC4); //no match
  text("If the colour and the word do NOT match, press \"NO MATCH\".", 300, 210);
  
  rects(283, 248, 84, 20, #719BC4); //3 seconds
  text("You will have around 3 seconds to answer each question.", 300, 245);
  
  rects(122, 303, 126, 20, #719BC4); //please note
  rects(461, 303, 73, 20, #719BC4); //will not
  text("PLEASE NOTE: Clicking on the home button will NOT save", 300, 300);
  text("your progress and will take you back to the main menu.", 300, 325);
  
  text("*click anywhere to continue*", 300, 370);
  
  
}

//instructions clicks ------------------------------------------------------------------
void instructionsClicks() {
  mode = lastPage;
}
