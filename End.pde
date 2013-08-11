class End extends Wall
{
  PVector loc, endSize;

  End(PVector wayPoint0, PVector wayPoint1, PVector loc, PVector endSize, float speed)
  {
    super(wayPoint0, wayPoint1, loc, endSize, speed);
    this.loc = loc;
    this.endSize = new PVector(10, 10);
  }

  void show()
  {
    fill(END_COLOR);
    rect(loc.x, loc.y, endSize.x, endSize.y);
  }
}

