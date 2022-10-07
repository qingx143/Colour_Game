/*
Zi Qing Xiong
1-4
September 20, 2022
Project 3 - True Colours

THINGS TO DO: COMPLETE
Notes: There is a small timer on the bottom left corner during the game mode
       - It's just the timer that goes up to 20, which is when the word timer resets
*/

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

int mode = 0;
final int INTRO = 1;
final int SETTING = 2;
final int INSTRUCTIONS = 3;
final int GAME = 4;
final int GAMEOVER = 5;

//colours ------------------------------------------------------------------------------
color backgroundColour = #A9C6E3;
color buttonBase = color(255, 255, 255, 100);
color blue = #5D85FA;
color yellow = #FFF8BF;
color orange = #FFCE7E;
color green = #9BF597;
color pink = #FFB9DF;
color red = #FF716A;
color purple = #D28FFC;

//images -------------------------------------------------------------------------------
PImage sadBongo, happyBongo, mute, unmute, settingsIcon, homeIcon, muteSet, unmuteSet;
PImage[] bongoGif= new PImage[2];
int imageSpeed = 0;

//music --------------------------------------------------------------------------------
Minim minim;
AudioPlayer main;
AudioPlayer[] soundEffects = new AudioPlayer[2];
float volumeMain = -10;
float volumeEffects = -10;
float sliderX1 = 300;
float sliderX2 = 300;

//game ---------------------------------------------------------------------------------
int randomChance = 0;
int randomWord = 0;
int randomColour = 0;
String[] words = {"BLUE", "YELLOW", "ORANGE", "GREEN", "PINK", "RED", "PURPLE"};
color[] colours = {blue, yellow, orange, green, pink, red, purple};
int wordSize = 1;
int wordMatch = 0;
int wordMatchGuess = 0;
int score = 0;
int highscore = 0;
boolean lose = true;

//others -------------------------------------------------------------------------------
boolean dropdown = false;
int lastPage = 1;
boolean leftkey = false;
boolean rightkey = false;

//setup --------------------------------------------------------------------------------
void setup() {
  size(600, 400);
  background(backgroundColour);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);
  strokeWeight(3);
  
  //images -----------------------------------------------------------------------------
  sadBongo = loadImage("SadBongoCat.png");
  happyBongo = loadImage("HappyBongoCat.png");
  mute = loadImage("NoSound.png");
  unmute = loadImage("Sound.png");
  settingsIcon = loadImage("SettingsIcon.png");
  homeIcon = loadImage("HomeIcon.png");
  muteSet = loadImage("MuteSet.png");
  unmuteSet = loadImage("UnmuteSet.png");
  
  bongoGif[0] = loadImage("bongo1.tiff");
  bongoGif[1] = loadImage("bongo2.tiff");
  
  //music ------------------------------------------------------------------------------
  minim = new Minim(this);
  main = minim.loadFile("BGM-ColourGame.mp3");
  soundEffects[0] = minim.loadFile("SFX-Wrong.mp3");
  soundEffects[1] = minim.loadFile("SFX-Correct.mp3");
  
  mode = INTRO;
  main.loop();
}

//draw ---------------------------------------------------------------------------------
void draw() {
  if (mode == INTRO) 
    intro();
  else if (mode == SETTING) 
    setting();
  else if (mode == INSTRUCTIONS)
    instructions();
  else if (mode == GAME) 
    game();
  else if (mode == GAMEOVER) 
    gameover();
  else 
    println("Error: Mode = " + mode);
  options();
  noStroke();
  buttons(560, 40, 50, 50, 5, buttonBase); //home button
  image(homeIcon, 560, 40, 40, 40);
}

void options() {
  fill(buttonBase);
  if (mouseX >= 15 && mouseX <= 65 && mouseY >= 15 && mouseY <= 65 || dropdown) {
    if (mouseX >= 15 && mouseX <= 65 && mouseY >= 15 && mouseY <= 225) {
      dropdown = true;
      noStroke();
      rect(40, 120, 50, 210, 5);
      buttons(40, 100, 35, 35, 5, buttonBase); //instructions
      fill(#659ED6);
      textSize(30);
      text("?", 40, 95);
      
      noStroke();
      buttons(40, 145, 35, 35, 5, buttonBase); //mute and unmute
      if (main.isMuted())
        image(mute, 40, 145, 30, 30);
      else
        image(unmute, 40, 145, 30, 30);
      
      noStroke();
      buttons(40, 190, 35, 35, 5, buttonBase); //settings
      image(settingsIcon, 40, 190, 30, 30);
    }
    else
      dropdown = false;
  }
  else 
    dropdown = false;
    
  strokeWeight(5);
  stroke(255);
  line(25, 28, 55, 28);
  line(25, 40, 55, 40);
  line(25, 52, 55, 52);
  strokeWeight(3);
  noStroke();
  buttons(40, 40, 50, 50, 5, buttonBase);
}

//rects --------------------------------------------------------------------------------
void rects(float x, float y, float w, float h, color colour) {
  noStroke();
  fill(colour); 
  rect(x, y, w, h);
  fill(255);
}

//normal buttons -----------------------------------------------------------------------
void buttons(float x, float y, float w, float h, float corners, color colour) {
  fill(colour);
  tactileRect(x, y, w, h);
  rect(x, y, w, h, corners);
}

//tactile buttons ----------------------------------------------------------------------
void tactileRect(float x, float y, float w, float h) {
  if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) 
    stroke(255);
}

//action buttons -----------------------------------------------------------------------
void changeRect(float x, float y, float w, float h, int newMode) {
  if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) 
    mode = newMode;
}

//action buttons -----------------------------------------------------------------------
void changeRect2(float x, float y, float w, float h, int newMode) {
  if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) {
    lastPage = mode;
    mode = newMode;
  }
}

//action buttons -----------------------------------------------------------------------
void changeRectIntro(float x, float y, float w, float h) {
  if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) {
    score = 0;
    wordSize = 1;
    mode = INTRO;
  }
}
