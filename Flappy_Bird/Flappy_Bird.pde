Bird bird;
ArrayList<Pillar> pillars;

float lastX;
float xDistance = 700;
float yDistance = 300;

int score;

boolean autoJump = true;

void setup() {
  lastX = 500;
  score = 0;
  size(800, 600);
  bird = new Bird(new PVector(width/5, height/2), 50, 50); 
  pillars = new ArrayList<Pillar>();
  addPillar();
}


void draw() {
  background(66, 239, 245);

  bird.move();
  bird.getGroundCol();
  bird.show();

  for (int i = 0; i < pillars.size(); i++) {
    Pillar p = pillars.get(i);

    p.update();

    if (p.outOfRange()) {
      pillars.remove(i);
    }

    if (p.increaseScore(bird.pos)) {
      score++;
    }

    p.show();

    if (p.getCollsion(bird.getPos(), bird.getWidthHeight().x, bird.getWidthHeight().y)) {
      setup();
    }
  }

  if (frameCount % 50 == 0) {
    addPillar();
  }

  if (autoJump) {
    Pillar current;
    if (pillars.size() > 0) {
      current = pillars.get(0);
      if (current.hasPassed == true && pillars.size() > 1) {
        current = pillars.get(1);
      }

      if (bird.pos.y > current.y - bird.h - bird.vel) {
        bird.jump(-8);
      }
    }
  }

  fill(255);
  textSize(30); 
  text("score: " + score, 0, 30); 
  text("press f to turn on/off autojump", 325, 30);
  text("auto jump currently: " + autoJump, 375, 60);
}

void addPillar() {
  pillars.add(new Pillar(lastX, random(yDistance, height), yDistance, 5, 125));
  lastX += xDistance;
}

void keyPressed() {
  if (key == ' ' && !autoJump) {
    bird.jump(-8);
  }

  if (key == 'f') {
    autoJump = !autoJump;
  }
}
