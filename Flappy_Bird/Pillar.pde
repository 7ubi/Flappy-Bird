class Pillar{
  float x;
  float y;
  float yDist;
  float xSpeed; 
  float w;
  boolean hasPassed = false;
  
  Pillar(float x, float y, float yDist, float xSpeed, float w){
    this.x = x;
    this.y = y;
    this.yDist = yDist;
    this.xSpeed = xSpeed;
    this.w = w;
  }
  
  void update(){
    x -= xSpeed;
  }
  
  void show(){
    noStroke();
    fill(0, 255, 0);
    rect(x, y, w, height - y);
    rect(x, 0, w, y - yDist); 
  }
  
  boolean getCollsion(PVector pos, float w, float h){
    //bottom
    if(pos.x > x - w && pos.x < x + this.w && pos.y > y - h && pos.y < y + (height - y)){
      return true;
    }
    
    if(pos.x > x - w && pos.x < x + this.w && pos.y > 0 && pos.y < y - yDist){
      return true;
    }
    
    return false;
  }
  
  boolean increaseScore(PVector pos){
    if(pos.x > x + w && !hasPassed){
      hasPassed = true;  
      return true;
    }
    
    return false;
  }
  
  boolean outOfRange(){
    if(x < -w){
      return true;
    }
    return false;
  }
}
