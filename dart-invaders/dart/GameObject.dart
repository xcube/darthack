
class GameObject {

  int x, y;
  int width, height;

  GameObject(int this.x, int this.y, int this.width, int this.height) {
  }

  void paint() {
    
  }

  void tick(double delta) {
    
  }

  /* check whether the given game object collides with this one */
  bool collide(GameObject other) {
    return !((other.minX() > this.maxX()) ||
        (this.minX() > other.maxX()) ||
        (other.minY() > this.maxY()) ||
        (this.minY() > other.maxY()));
  }

  /* is the given GameObject contained within this one */
  bool within(GameObject other) {
    return ((other.minX() > this.minX()) &&
        (other.maxX() < this.maxX()) &&
        (other.minY() > this.minY()) &&
        (other.maxY() < this.maxY()));
  }
  
  int minX() => x;
  int maxX() => x + width;
  int minY() => y;
  int maxY() => y + height;
}
