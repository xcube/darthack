
class GameObject {

  Point pos;
  int width, height;
  GameContext gameContext;

  GameObject parent;

  GameObject(GameContext this.gameContext, int x, int y, int this.width, int this.height) {
    this.pos = new Point(x, y);
    this.parent = null;
  }

  void paint() {
    // implemented by sub-classes
  }

  void tick(double delta) {
    // implemented by sub-classes
  }

  /* instruct object to remove itself from its parent if it has one*/
  void remove() {
    if (null != parent) {
      try {
        parent.removeChild(this);
      } catch (final NoSuchMethodException e) {
        // remove object failed
      }
    }
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

  int minX() => pos.x;
  int maxX() => pos.x + width;
  int minY() => pos.y;
  int maxY() => pos.y + height;

  void rotate(num deg) {
    gameContext.ctx.rotate(Util.toRad(deg));
  }

  void translate(int xUnits, yUnits) {
    pos.x += xUnits;
    pos.y += yUnits;
  }
}
