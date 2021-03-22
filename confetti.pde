class confetti
{
  float size;
  float posX;
  float posY;
  float angle;
  float seed;
  confetti(float posX,float posY,float size,float angle,float seed)
  {
    this.size = size;
    this.posX = posX;
    this.posY = posY;
    this.angle = angle;
    this.seed = seed;
  }
  void drawConf()
  {
    translate(posX+size/2,posY+size/6);
    rotate(TWO_PI*(360/angle));
    rect(posX,posY,size,size/3);
    translate(-posX+size/2,-posY+size/6);
  }
}
