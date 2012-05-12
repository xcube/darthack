class AlienShip extends PathAnimatedImageObject {

  AlienShip(GameContext gameContext, int width, int height, List<Point> wayPoints, double speed, String bitmap) : super(gameContext, width, height, wayPoints, speed, bitmap) {
  }

  void tick(double delta) {
    super.tick(delta);

    if (Math.random() > 0.99) {
      if (null != parent) {
        Bomb bomb = new Bomb(gameContext, pos.x, pos.y, 40);
        try {
          parent.addChild(bomb);
        } catch (final NoSuchMethodException e) {
          // remove object failed
        }
      }
    }
  }
}
