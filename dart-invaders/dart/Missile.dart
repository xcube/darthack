
class Missile extends Bomb {

  static final String MISSILE_IMAGE = "img/missile.png";
  Player player;

  Missile(GameContext gameContext, Player this.player, int x, int y,  int speed) : super.image(gameContext, x, y, -speed, MISSILE_IMAGE) {
    this.damage = 25;
  }


  void detectCollision() {
    List<GameObject> gameObjects = parent.getChildren();
    for (GameObject gameObject in gameObjects) {
      if (gameObject is AlienShip) {
        if(collide(gameObject)) {
          // create explosion
          Explosion exp = new Explosion(gameContext, gameObject.pos.x, gameObject.pos.y);
          parent.addChild(exp);
          // increment score
          player.scoreHit(gameObject);
          // remove missile and alien ship
          remove();
          gameObject.remove();
          break;
        }
      }
    }
  }
}
