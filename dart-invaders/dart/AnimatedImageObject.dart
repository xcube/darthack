class AnimatedImageObject extends Ship {
  MovingObject mover;

  AnimatedImageObject(GameContext gameContext, int width, int height, List<Point> wayPoints, double speed, String bitmap) : super(gameContext, 0, 0, width, height, bitmap) {
    this.mover = new MovingObject.path(gameContext, width, height, wayPoints, speed);
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
