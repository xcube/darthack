class Bomb extends AnimatedImageObject implements Weapon{

  static final String BOMB_IMAGE = "img/bomb.png";
  int damage;

  Bomb(GameContext gameContext, int x, int y,  int speed) : super(gameContext, x, y, 20, 20, new Point(0, speed), BOMB_IMAGE) {
    this.damage = 25;
  }

  Bomb.image(GameContext gameContext, int x, int y,  int speed, String image) : super(gameContext, x, y, 20, 20, new Point(0, speed), image) {
    this.damage = 25;
  }

  void tick(double delta) {
    super.tick(delta);
    if(detectCollision()) {
      gameContext.getPlayerShip().takeHitFrom(this);
      remove();
    }
    if (pos.y > GameScreen.GAME_HEIGHT) {
      remove();
    }
  }

  int getDamage() {
    return damage;
  }

  bool detectCollision() {
    return collide(gameContext.getPlayerShip());
  }
}