class AlienShip extends PathAnimatedImageObject {

  static final int SHOOT_RATE_MILLIS = 1000;

  int pointsWorth;
  int lastShoot = 0;

  AlienShip(GameContext gameContext, int width, int height, List<Point> wayPoints, double speed, String bitmap, int points) : super(gameContext, width, height, wayPoints, speed, bitmap) {
    this.pointsWorth = points;
  }

  void tick(double delta) {
    super.tick(delta);

    if (lastShoot == 0 || lastShoot < Util.currentTimeMillis() - SHOOT_RATE_MILLIS ) {
      if (Math.random() > 0.99) {
        if (null != parent) {
          Bomb bomb = new Bomb(gameContext, pos.x + 16, pos.y + 20, 40);
          try {
            parent.addChild(bomb);
            } catch (final NoSuchMethodException e) {
              // remove object failed
          }
        }
      }
    }
  }

  int getPointsWorth() {
    return pointsWorth;
  }
}
