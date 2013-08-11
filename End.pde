class End
{
  PVector loc, endSize;

  End(PVector loc)
  {
    this.loc = loc;
    this.endSize = new PVector(10, 10);
  }

  void show()
  {
    fill(END_COLOR);
    rect(loc.x, loc.y, endSize.x, endSize.y);
  }
}

