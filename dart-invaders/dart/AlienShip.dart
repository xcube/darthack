class AlienShip extends PathAnimatedImageObject {

  int pointsWorth;

  AlienShip(GameContext gameContext, int width, int height, List<Point> wayPoints, double speed, String bitmap, int points) : super(gameContext, width, height, wayPoints, speed, bitmap) {
    this.pointsWorth = points;
  }

  void tick(double delta) {
    super.tick(delta);

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

  int getPointsWorth() {
    return pointsWorth;
  }
}
