class AnimatedImageObject extends Ship {
  MovingObject mover;

  AnimatedImageObject(GameContext gameContext, int x, int y, int width, int height, Point delta, String bitmap) : super(gameContext, x, y, width, height, bitmap) {
    this.mover = new MovingObject(gameContext, x, y, width, height, delta);
    updatePosition();
  }

  /* delegate movment to mover */
  void tick(double delta) {
    mover.tick(delta);
    updatePosition();
  }

  void updatePosition() {
    pos.x = mover.pos.x;
    pos.y = mover.pos.y;
  }

  void setPathEndBehaviour(int option) {
    mover.pathEndBehaviour = option;
  }
}
