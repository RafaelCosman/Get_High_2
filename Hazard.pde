class Hazard
{
  PVector wayPoint0, wayPoint1, vel, loc, hazardSize;
  float speed;

  Hazard(PVector wayPoint0, PVector wayPoint1, PVector loc, PVector hazardSize, float speed)
  {
    this.wayPoint0 = wayPoint0;
    this.wayPoint1 = wayPoint1;
    this.vel = new PVector();
    this.loc = loc;
    this.hazardSize = hazardSize;
    this.speed = speed;
  }

  void show()
  {
    fill(HAZARD_COLOR);
    rect(loc.x, loc.y, hazardSize.x, hazardSize.y);
  }

  void run()
  {
    if (loc.dist(wayPoint0) <= speed)
      vel.add(PVector.sub(wayPoint1, loc));
    if (loc.dist(wayPoint1) <= speed)
      vel.add(PVector.sub(wayPoint0, loc));
    vel.setMag(speed);
    loc.add(vel);
  }
}

