final color WALL_COLOR = color(0);
final color HAZARD_COLOR = color(255, 0, 0);

Player player;
PVector playerStartLoc;
ArrayList<Wall> walls;
ArrayList<Hazard> hazards;
boolean[] keys;
int currentLevel;

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
    player = new Player(new PVector(playerStartLoc.x, playerStartLoc.y), new PVector(0, 0), new PVector(10, 10), .25, false);
    walls = new ArrayList<Wall>();
    walls.add(new Wall(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(width / 2, 400), new PVector(100, 100), 0));
    walls.add(new Wall(new PVector(100, 400), new PVector(125, 400), new PVector(-2, 0), new PVector(125, 400), new PVector(100, 10), 2));
    hazards = new ArrayList<Hazard>();
    hazards.add(new Hazard(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(200, 265), new PVector(100, 10), 0));
    hazards.add(new Hazard(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(245, 355), new PVector(10, 10), 0));
  } else if (currentLevel == 2)
  {
    playerStartLoc = new PVector(width / 2, height / 2);
    player = new Player(new PVector(playerStartLoc.x, playerStartLoc.y), new PVector(0, 0), new PVector(10, 10), .25, false);
    walls = new ArrayList<Wall>();
    walls.add(new Wall(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(width / 2, 400), new PVector(100, 100), 0));
    walls.add(new Wall(new PVector(100, 400), new PVector(125, 400), new PVector(-2, 0), new PVector(125, 400), new PVector(100, 10), 2));
    hazards = new ArrayList<Hazard>();
    hazards.add(new Hazard(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(200, 265), new PVector(100, 10), 0));
    hazards.add(new Hazard(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(245, 355), new PVector(10, 10), 0));
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

