class AlienShip extends Ship {
  MovingObject mover;

  AlienShip(GameContext gameContext, int width, int height, List<Point> wayPoints, double speed) : super(gameContext, 0, 0, width, height, 'img/Space Invaders 2.png') {
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
}
