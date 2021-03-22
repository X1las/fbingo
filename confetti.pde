class confetti
{
  float size;
  float posX;
  float posY;
  float angle;
  float seed;
  color col;
  int minrange,maxrange;
  float direction;
  confetti(float posX,float posY,float size,float angle,float seed, int minrange, int maxrange)
  {
    this.size = size;
    this.posX = posX;
    this.posY = posY;
    this.angle = angle;
    this.seed = seed;
    this.minrange = minrange;
    this.maxrange = maxrange;
    this.col = color(random(minrange,maxrange),random(minrange,maxrange),random(minrange,maxrange));
    direction = random(-1,1);
  }
  void updateConf(float incr)
  {
    this.posY+=incr*seed/3;
    this.angle+=incr*seed/2*direction;
    if (posY > displayHeight) 
    {
      this.posY = -size;
      this.posX = random(size,displayWidth-size); 
      this.col = color(random(minrange,maxrange),random(minrange,maxrange),random(minrange,maxrange));
    }
  }
  void drawConf()
  {
    float rotat = TWO_PI*(360/angle);
    float poX = posX+size/2;
    float poY = posY+size/6;
    translate(poX,poY);
    rotate(rotat);
    fill(col);
    rect(0,0,size,size/3);
    rotate(-rotat);
    translate(-poX,-poY);
  }
}
