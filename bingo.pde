// Variables:
int balls = 90;
int ballCount = 1;
int[] numbers = new int[balls];
boolean trig = false;
float circleScale = 1;
boolean decr = false;
int showNumb = 0;
int numb;
color ballCol = color(random(255),random(255),random(255));
int bgseg = 20;
PImage logo;
PFont cursive, def;

String BotBesked1 = "GAVEKORT TIL";
String BotBesked2 = "Sushi2500, Cafe Freunde, Cafe Breeze";

void setup()
{
  def = createFont("Lucida Sans", 12);
  cursive = createFont("Brush Script MT Italic",12);
  logo = loadImage("images/bingo2.png");
  fullScreen();  
  numbers[0] = 0;
}

void draw()
{
  // Updating variables
  float rectW = displayWidth/3;
  float rectH = displayHeight/1.7;
  float rectX = displayWidth/15;
  float rectY = displayHeight/2-rectH/2;
  float elipW = (rectW*0.8)*circleScale;
  float elipH = elipW;
  float elipX = rectX + elipW/2 + (rectW-elipW)/2;
  float elipY = rectY + elipH/2 + (rectH-elipH)/2;
  
  // Background update
  for (int i = 0 ; i <= bgseg ; i++)
  {
    fill(70+1*i,70+3*i,100+1*i);
    noStroke();
    rect(0,displayHeight-displayHeight/bgseg*i,displayWidth,displayHeight/bgseg);
  }
  
  // Drawing text
  fill(200);
  textFont(cursive);
  textSize(displayWidth/30);
  textAlign(CENTER,BOTTOM);
  text(BotBesked2,displayWidth/3,displayHeight/1.03);
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
  int logoW = displayWidth/5;
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
      circleScale-=.05;
    } else
    {
      showNumb = numb;
      ballCol = color(random(255),random(255),random(255));
      decr = false;
    }
  } else
  {
    if (circleScale < 1)
    {
      circleScale+=.05;
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
  if (keyCode == 32)
  {
    trig = true;
    numb = numberPicker(balls,numbers);
    numbers[ballCount] = numb;
    ballCount++;
    println("The number is: " + numb + " with " + ballCount + " numbers having been drawn!");
  }
}
