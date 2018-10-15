Particle [] bob;
void setup()
{
  frameRate(300);
  size(600,600);
  bob = new Particle[1000];
  for (int i=0; i<bob.length; i++)
    bob[i] = new NormalParticle();
    bob[0] = new OddballParticle();
  bob[1] = new JumboParticle();
}
void draw()
{
  background(0);
  for(int i=0; i < bob.length; i++)
  {
    bob[i].show();
    bob[i].move();
  }
}
class NormalParticle implements Particle
{
  double myX, myY, mySpeed, myAngle;
  int Color;
  NormalParticle()
  {
    myAngle = Math.PI*2*Math.random();
    mySpeed = Math.random()*10;
    myX = 300;
    myY = 300;
    Color = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  }
  public void move()
  {
    myX = myX + (mySpeed * Math.cos(myAngle));
    myY = myY + (mySpeed * Math.sin(myAngle));
  }
  public void show()
  {
    fill(Color);
    ellipse((float)myX,(float)myY, 10, 10);
  }
}
interface Particle
{
  public void show();
  public void move();
}
class JumboParticle extends NormalParticle
{
  public void show()
  {
    ellipse((float)myX, (float)myY, 40, 40);
  }
}
class OddballParticle implements Particle
{
  double myX, myY, mySpeed;
  int myColor;
  OddballParticle()
  {
    myX = myY = 300;
    myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
    mySpeed = Math.random()*10;
  }
  public void move()
  {
    if (myX > 100 && myX < 500)
      myX = myX + (Math.random()*20)-10;
    if (myY > 100 && myY < 500)
      myY = myY + (Math.random()*20)-10;
    if (myX > 500)
      myX = myX - mySpeed;
    if (myX < 100)
      myX = myX + mySpeed;
    if (myY > 500)
      myY = myY - mySpeed;
    if (myY < 100)
      myY = myY + mySpeed;
  }
  public void show()
  {
    fill(myColor);
    rect((float)myX,(float)myY,30,30);
  }
}

