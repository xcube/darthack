
class Missile extends Bomb {

  static final String MISSILE_IMAGE = "img/missile.png";

  Missile(GameContext gameContext, int x, int y,  int speed) : super.image(gameContext, x, y, -speed, MISSILE_IMAGE) {
    this.damage = 25;
  }


  void detectCollision() {
    List<GameObject> gameObjects = parent.getChildren();
    for (GameObject gameObject in gameObjects) {
      if (gameObject is AlienShip) {
        // TODO
      }
    }
  }
}
