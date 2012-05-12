class Explosion extends ContainerImpl {

  static final int NUM_FRAGMENTS = 50;
  static final double FRAGMENT_SPEED = 150.0;

  Explosion(GameContext ctx, int x, int y) : super(ctx, x, y, 0, 0) {
    for (var i=0; i<NUM_FRAGMENTS; ++i) {
      double dir = Util.random() * Math.PI * 2.0;
      double speed = FRAGMENT_SPEED * Math.random() + FRAGMENT_SPEED;
      double dx = Math.cos(dir) * speed;
      double dy = Math.sin(dir) * speed;
      Point direction = new Point(dx, dy);
      AnimatedImageObject frag = new AnimatedImageObject(ctx, x, y, 4, 4, direction, null);
      addChild(frag);
    }
  }

  void paint() {
    paintChildren();
  }

  void tick(delta) {
    tickChildren(delta);

    List<GameObject> toRemove = new List<GameObject>();
    for (var f in children) {
      if ((f.pos.x < 0) || (f.pos.x > GameScreen.GAME_WIDTH) ||
          (f.pos.y < 0) || (f.pos.y > GameScreen.GAME_HEIGHT)) {
        toRemove.add(f);
      }
    }

    for (var f in toRemove) {
      removeChild(f);
    }
  }
}
