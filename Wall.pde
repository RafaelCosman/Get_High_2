class Wall
{
  PVector wayPoint0, wayPoint1, vel, loc, wallSize;
  float speed;

  Wall(PVector wayPoint0, PVector wayPoint1, PVector loc, PVector wallSize, float speed)
  {
    this.wayPoint0 = wayPoint0;
    this.wayPoint1 = wayPoint1;
    this.vel = new PVector();
    this.loc = loc;
    this.wallSize = wallSize;
    this.speed = speed;
  }

  void show()
  {
    fill(WALL_COLOR);
    rect(loc.x, loc.y, wallSize.x, wallSize.y);
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

