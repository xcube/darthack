
class Missile extends Bomb {

  static final String MISSILE_IMAGE = "img/missile.png";

  Missile(GameContext gameContext, int x, int y,  int speed) : super.image(gameContext, x, y, -speed, MISSILE_IMAGE) {
    this.damage = 25;
  }
}
