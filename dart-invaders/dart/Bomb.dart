class Bomb extends AnimatedImageObject {

  static final String BOMB_IMAGE = "img/bomb.png";

  Bomb(GameContext gameContext, int x, int y,  int speed) : super(gameContext, x, y, 20, 20, new Point(0, speed), BOMB_IMAGE) {
  }

  void tick(double delta) {
    super.tick(delta);

    if (pos.y > GameScreen.GAME_HEIGHT) {
      remove();
    }
  }
}