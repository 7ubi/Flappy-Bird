class Bird {
  PVector pos;
  float vel;
  float gravAcc = 0.2;
  float w;
  float h;

  Bird(PVector pos, float w, float h) {
    this.pos = pos;
    this.w = w;
    this.h = h;
  }

  void move() {
    vel += gravAcc;

    pos.y += vel;
  }

  void jump(float force) {
    vel = force;
  }

  PVector getPos() {
    return pos;
  }
  
  PVector getWidthHeight(){
    return new PVector(w, h);
  }
  
  void getGroundCol(){
    if(pos.y > height - h){
      setup();
    }
    
    if(pos.y < 0){
      pos.y = 0;    
      vel = 0;
    }
  }
  
  void show() {
    noStroke();
    fill(255, 0, 0);
    rect(pos.x, pos.y, w, h);
  }
}
