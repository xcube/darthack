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
    detectCollision();
    if (pos.y > GameScreen.GAME_HEIGHT) {
      remove();
    }
  }

  int getDamage() {
    return damage;
  }

  void detectCollision() {
//    try {
    if(collide(gameContext.getPlayerShip())) {
      bool lostLife = gameContext.getPlayerShip().takeHitFrom(this);

      if(lostLife) {
        Explosion explosion = new Explosion(gameContext, pos.x, pos.y);
        gameContext.getScreen().addChild(explosion);
      }
      remove();
    }
//  } catch (final Exception e) {
//  }
  }
}