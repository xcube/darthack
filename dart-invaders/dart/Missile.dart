
class Missile extends Bomb {

  static final String BOMB_IMAGE = "img/bomb.png";

  Missile(GameContext gameContext, int x, int y,  int speed) : super(gameContext, x, y, -speed) {
    this.damage = 25;
  }
}
