Player player;
End end;
PVector playerStartLoc;
ArrayList<Wall> walls;
ArrayList<Hazard> hazards;
boolean[] keys;
int currentLevel;

static final PVector NO_WAYPOINT = new PVector(-1, -1);

final color HAZARD_COLOR = color(255, 0, 0);
final color WALL_COLOR = color(0);
final color END_COLOR = color(0, 255, 255);

void setup()
{
  size(600, 600, P3D);
  smooth();
  noStroke();
  rectMode(CENTER);
  keys = new boolean[4];
  currentLevel = 1;
  reset();
}

void reset()
{
  if (currentLevel == 1)
  {
    playerStartLoc = new PVector(width / 2, height / 2 + 25);
    player = new Player(new PVector(playerStartLoc.x, playerStartLoc.y), .25, false);
    walls = new ArrayList<Wall>();
    walls.add(new Wall(new PVector(), new PVector(), new PVector(width / 2, 400), new PVector(100, 100), 0));
    walls.add(new Wall(new PVector(125, 400), new PVector(100, 400), new PVector(125, 400), new PVector(100, 10), 2));
    hazards = new ArrayList<Hazard>();
    hazards.add(new Hazard(new PVector(), new PVector(), new PVector(200, 265), new PVector(100, 10), 0));
    hazards.add(new Hazard(new PVector(), new PVector(), new PVector(245, 355), new PVector(10, 10), 0));
    hazards.add(new Hazard(new PVector(), new PVector(), new PVector(width / 2, height), new PVector(1000, 10), 0));
    end = new End(new PVector(112.5, 390));
  } else if (currentLevel == 2)
  {
    playerStartLoc = new PVector(width / 2, height / 2 + 25);
    player = new Player(new PVector(playerStartLoc.x, playerStartLoc.y), .25, false);
    walls = new ArrayList<Wall>();
    //walls.add(new Wall(new PVector(), new PVector(), new PVector(width / 2, 400), new PVector(100, 100), 0));
    walls.add(new Wall(NO_WAYPOINT, new PVector(1400, 400), new PVector(width / 2 - 100, 400), new PVector(100, 10), 2.5));
    hazards = new ArrayList<Hazard>();
    hazards.add(new Hazard(new PVector(), new PVector(), new PVector(width / 2 + 100, 390), new PVector(10, 10), 0));
    hazards.add(new Hazard(new PVector(), new PVector(), new PVector(width / 2 + 300, 390), new PVector(50, 10), 0));
    hazards.add(new Hazard(new PVector(), new PVector(), new PVector(width / 2 + 500, 390), new PVector(100, 10), 0));
    hazards.add(new Hazard(new PVector(), new PVector(), new PVector(width / 2 + 700, 390), new PVector(150, 10), 0));
    hazards.add(new Hazard(new PVector(width / 2 + 775, 390), new PVector(width / 2 + 860, 390), new PVector(width / 2 + 715, 390), new PVector(10, 10), 2));
    hazards.add(new Hazard(new PVector(), new PVector(), new PVector(width / 2 + 935, 390), new PVector(150, 10), 0));
    hazards.add(new Hazard(new PVector(), new PVector(), new PVector(width / 2 + 525, height), new PVector(2000, 10), 0));
    end = new End(new PVector(1400, 390));
  } else if (currentLevel == 3)
  {
    playerStartLoc = new PVector(width / 2, 420);
    player = new Player(new PVector(playerStartLoc.x, playerStartLoc.y), .25, false);
    walls = new ArrayList<Wall>();
    walls.add(new Wall(new PVector(), new PVector(), new PVector(width / 2, 430), new PVector(10, 10), 0));
    walls.add(new Wall(new PVector(), new PVector(), new PVector(width / 2, 350), new PVector(10, 10), 0));
    walls.add(new Wall(new PVector(), new PVector(), new PVector(width / 2 + 550, 270), new PVector(800, 10), 0));
    hazards = new ArrayList<Hazard>();
    hazards.add(new Hazard(new PVector(width / 2 - 100, 390), new PVector(width / 2 + 100, 390), new PVector(width / 2, 390), new PVector(155, 10), 4));
    hazards.add(new Hazard(new PVector(width / 2 + 100, 150), new PVector(width / 2 + 100, 350), new PVector(width / 2 + 100, 200), new PVector(10, 155), 4));
    hazards.add(new Hazard(new PVector(width / 2 + 250, 250), new PVector(width / 2 + 350, 250), new PVector(width / 2 + 250, 250), new PVector(10, 50), 3));
    hazards.add(new Hazard(new PVector(width / 2 + 350, 250), new PVector(width / 2 + 450, 250), new PVector(width / 2 + 350, 250), new PVector(10, 50), 3));
    hazards.add(new Hazard(new PVector(width / 2 + 450, 250), new PVector(width / 2 + 550, 250), new PVector(width / 2 + 450, 250), new PVector(10, 50), 3));
    hazards.add(new Hazard(new PVector(width / 2 + 550, 250), new PVector(width / 2 + 650, 250), new PVector(width / 2 + 550, 250), new PVector(10, 50), 3));
    hazards.add(new Hazard(new PVector(width / 2 + 650, 250), new PVector(width / 2 + 750, 250), new PVector(width / 2 + 650, 250), new PVector(10, 50), 3));
    hazards.add(new Hazard(new PVector(width / 2 + 750, 250), new PVector(width / 2 + 850, 250), new PVector(width / 2 + 750, 250), new PVector(10, 50), 3));
    hazards.add(new Hazard(new PVector(), new PVector(), new PVector(width / 2 + 525, height), new PVector(2000, 10), 0));
    end = new End(new PVector(width / 2 + 875, 260));
  }
}
void draw()
{
  background(127.5);
  for (Wall w : walls)
  {
    w.show();
    w.run();
  }
  for (Hazard h : hazards)
  {
    h.show();
    h.run();
  }
  end.show();
  player.run();
  camera(player.loc.x, player.loc.y, height / 2 / tan(PI * 30 / 180) * 1, player.loc.x, player.loc.y, 0, 0, 1, 0);
  player.show();
}

void keyPressed()
{
  if (keyCode == LEFT)
    keys[0] = true;
  if (keyCode == RIGHT)
    keys[1] = true;
  if (keyCode == UP)
    keys[2] = true;
  if (key == 'r')
    reset();
  if (key == '1')
  {
    currentLevel = 1;
    reset();
  }
  if (key == '2')
  {
    currentLevel = 2;
    reset();
  }
  if (key == '3')
  {
    currentLevel = 3;
    reset();
  }
}

void keyReleased()
{
  if (keyCode == LEFT)
    keys[0] = false;
  if (keyCode == RIGHT)
    keys[1] = false;
  if (keyCode == UP)
    keys[2] = false;
}

