class Player
{
  PVector loc, vel, playerSize;
  float gravity;
  boolean grounded;

  Player(PVector loc, PVector vel, PVector playerSize, float gravity, boolean grounded)
  {
    this.loc = loc;
    this.vel = vel;
    this.playerSize = playerSize;
    this.gravity = gravity;
    this.grounded = grounded;
  }

  void show()
  {
    fill(0, 255, 0);
    rect(loc.x, loc.y, playerSize.x, playerSize.y);
  }

  void run()
  {
    for (int x = int(width / 2 - (playerSize.x / 2)); x <= int(width / 2 + (playerSize.x / 2)); x ++)
    {
      for (int y = int(height / 2 - (playerSize.y / 2)); y <= int(height / 2 + (playerSize.y / 2)); y ++)
      {
        if (get(x, y) == WALL_COLOR)
        {
          loc.sub(vel);
          vel.set(0, 0, 0);
        } else if (get(x, y) == HAZARD_COLOR)
          reset();
      }
    }
    int rightCollisions = 0;
    int leftCollisions = 0;
    grounded = false;
    boolean shouldBreak = false;
    for (int y = int(height / 2 - (playerSize.y / 2)); y <= int(height / 2 + (playerSize.y / 2)); y ++)
    {
      if (get(int(width / 2 + (playerSize.x / 2) + 1), y) == WALL_COLOR || get(int(width / 2 - (playerSize.x / 2) - 1), y) == WALL_COLOR)
      {
        float minDistToWall = 9999999;
        for (Wall w : walls)
        {
          if (dist(player.loc.x, player.loc.y, w.loc.x, w.loc.y) <= minDistToWall)
            minDistToWall = dist(player.loc.x, player.loc.y, w.loc.x, w.loc.y);
        }
        for (Wall w : walls)
        {
          if (dist(loc.x, loc.y, w.loc.x, w.loc.y) == minDistToWall)
          {
            loc.x += w.vel.x;
            if (w.vel.x > 0)
              leftCollisions ++; else if (w.vel.x < 0)
              rightCollisions ++;
            grounded = false;
            shouldBreak = true;
            break;
          }
        }
      }
      if (shouldBreak)
        break;
    }
    shouldBreak = false;
    for (int x = int(width / 2 - (playerSize.x / 2)); x <= int(width / 2 + (playerSize.x / 2)); x ++)
    {
      if (get(x, int(height / 2 + (playerSize.y / 2) + 1)) == WALL_COLOR || get(x, int(height / 2 - (playerSize.y / 2) - 1)) == WALL_COLOR)
      {
        float minDistToWall = 9999999;
        for (Wall w : walls)
        {
          if (dist(player.loc.x, player.loc.y, w.loc.x, w.loc.y) <= minDistToWall)
            minDistToWall = dist(player.loc.x, player.loc.y, w.loc.x, w.loc.y);
        }
        for (Wall w : walls)
        {
          if (w.vel.y != 0 && dist(loc.x, loc.y, w.loc.x, w.loc.y) == minDistToWall)
          {
            loc.y += w.vel.y;
            grounded = false;
            shouldBreak = true;
            break;
          }
        }
      }
      if (shouldBreak)
        break;
    }
    for (int y = int(height / 2 - (playerSize.y / 2)); y <= int(height / 2 + (playerSize.y / 2)); y ++)
    {
      if (get(int(width / 2 + playerSize.x), y) == WALL_COLOR)
        rightCollisions ++;
      if (get(int(width / 2 - playerSize.x), y) == WALL_COLOR)
        leftCollisions ++;
    }
    for (int x = int(width / 2 - (playerSize.x / 2)); x <= int(width / 2 + (playerSize.x / 2)); x ++)
    {
      if (get(x, int(height / 2 + (playerSize.y / 2) + 1)) == WALL_COLOR)
        grounded = true;
    }
    if (!grounded)
      vel.y += gravity;
    if (keys[0] && leftCollisions == 0)
      loc.x -= 4;
    if (keys[1] && rightCollisions == 0)
      loc.x += 4;
    if (keys[2] && grounded)
      vel.y -= 7;
    loc.add(vel);
  }
}

