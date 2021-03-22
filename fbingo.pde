// Variables:
int balls = 90;                             // Amount of bingo balls in the game
int ballCount = 1;                          // Amount of balls, starting at 1
int showNumb = 0;                           // The numbers the balls show
int numb;                                   // A temporary int for choosing numbers
int bgseg = 20;                             // Segments of the background gradient
int[] numbers = new int[balls];             // Bingo balls array
int confCount = 150;

boolean trig = false;                       // Key trigger boolean
boolean decr = false;                       // Decrement trigger for ball spin animation
                                  
float circleScale = 1;                      // Scaling value for the balls' size
float colRange = 150;                       // Range of colors for random
float confSize = 60;
float confIncr = 1;

color ballCol = color(random(colRange),random(colRange),random(colRange));        // Initial ball color from random

PImage logo;                                                                      // Image variable for the logo

PFont cursive, def;                                                               // Fonts for cursive and default text

String BotBesked1 = "GAVEKORT TIL";                                               // Message for bottom left of the screen
String BotBesked2 = "Sushi2500, Cafe Freunde";                                    // Another message for bottom left of the screen

confetti[] conf = new confetti[confCount];

// Setup loop
void setup()
{
  // Defining fonts:
  def = createFont("Lucida Sans", 12);
  cursive = createFont("Brush Script MT Italic",12);
  
  logo = loadImage("images/bingo2.png");                                         // Loading logo image
  numbers[0] = 0;                                                                // Defining first number as 0
  fullScreen();                                                                  // Making program fullscreen
  
  /*for (int i = 0; i < confCount ; i++)
  {
    conf[i] = new confetti(random(confSize,displayWidth-confSize),random(confSize,displayHeight-confSize),confSize,random(360),random(100,600)/100,100,255);
  }
  */
}

void draw()
{
  // Updating variables
  
  // Rectangle:
  float rectW = displayWidth/3;
  float rectH = displayHeight/1.7;
  float rectX = displayWidth/15;
  float rectY = displayHeight/2-rectH/2;
  // Ball:
  float elipW = (rectW*0.8)*circleScale;
  float elipH = elipW;
  float elipX = rectX + elipW/2 + (rectW-elipW)/2;
  float elipY = rectY + elipH/2 + (rectH-elipH)/2;
  
  // Background update
  for (int i = 0 ; i <= bgseg ; i++)
  {
    fill(70+1*i,70+1*i,100+3*i);
    noStroke();
    rect(0,displayHeight-displayHeight/bgseg*i,displayWidth,displayHeight/bgseg);
  }
  
  // Making Confetti
  /*for (int i = 0; i < confCount ; i++)
  {
    conf[i].updateConf(confIncr);
    conf[i].drawConf();
  }
  */
  
  // Drawing text
  fill(200);
  
  // Bottom-most text:
  textFont(cursive);
  textSize(displayWidth/30);
  textAlign(CENTER,BOTTOM);
  text(BotBesked2,displayWidth/3,displayHeight/1.03);
  
  // Text above bottom-most text
  textFont(def);
  textSize(displayWidth/45);
  textAlign(CENTER,BOTTOM);
  text(BotBesked1,displayWidth/4.3,displayHeight/1.12);
  
  // Drawing box
  fill(70,70,100);
  stroke(120);
  strokeWeight(25);
  rect(rectX,rectY,rectW,rectH,10);
  
  // Drawing logo
  float logoW = displayWidth/3.5;
  image(logo, displayWidth/2-logoW/2, 0, logoW , logoW/2);
  
  // Trigger updating
  if (trig)
  {
    decr = true;
    trig = false;
  }
  if (decr)
  {
    if (circleScale>0)
    {
      circleScale-=.04;
    } else
    {
      showNumb = numb;
      ballCol = color(random(colRange),random(colRange),random(colRange));
      decr = false;
    }
  } else
  {
    if (circleScale < 1)
    {
      circleScale+=.04;
    } else
    {
      circleScale = 1;
    }
  }
  
  // Drawing circle
  fill(ballCol);
  strokeWeight(5);
  stroke(40);
  translate(elipX,elipY);
  rotate(TWO_PI*circleScale);
  ellipse(0,0,elipW,elipH);
  
  // Drawing text to circle
  if (elipW > 1 )
  {
    fill(255);
    textAlign(CENTER,CENTER);
    stroke(0);
    strokeWeight(4);
    if (showNumb == 0)
    {
      textSize(elipW/7);
      text("Welcome!",0,-elipH/30);
    } else
    {
      textSize(elipW/2);
      text(showNumb,0,-elipH/14);
    }
    translate(-elipX,-elipY);
  }
}

int numberPicker(int range , int[] array)
{
  int rand = int(random(1,range));
  for (int i : array)
  {
    if (rand == i)
    {
      rand = numberPicker(range,array);
      break;
    }
  }
  return rand;
}

void keyPressed()
{
  //println(keyCode);
  //println(key);
  if (keyCode == 34 || keyCode == 33 || keyCode == 32)
  {
    trig = true;
    numb = numberPicker(balls,numbers);
    numbers[ballCount] = numb;
    ballCount++;
    println("The number is: " + numb + " with " + ballCount + " numbers having been drawn!");
  }
}
