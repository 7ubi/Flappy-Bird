Bird bird;
ArrayList<Pillar> pillars;

float lastX;
float xDistance = 700;
float yDistance = 300;

void setup() {
  lastX = 200;
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
    
    if(p.outOfRange()){
      pillars.remove(i);
    }
    
    p.show();

    if (p.getCollsion(bird.getPos(), bird.getWidthHeight().x, bird.getWidthHeight().y)) {
      setup();
    }
  }
  
  if(frameCount % 50 == 0){
    addPillar();
  }
}

void addPillar() {
  pillars.add(new Pillar(lastX, random(yDistance, height), yDistance, 5, 125));
  lastX += xDistance;
}

void keyPressed() {
  if (key == ' ') {
    bird.jump(-8);
  }
}
