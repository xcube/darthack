
class PlayerShip extends Ship {

  static final int WIDTH = 32;
  static final int HEIGHT = 32;
  static final int KEY_LEFT = 37;
  static final int KEY_RIGHT = 39;
  static final int KEY_SPACE = 32;

  // time when the last missile was fired
  int lastShoot = 0;
  static final int SHOOT_RATE_MILLIS = 1 * 1000;
  Player player;

  PlayerShip(GameContext gameContext, Player player) : super(gameContext, 0, 0, WIDTH, HEIGHT, 'img/Space Invaders 1.png') {
    this.player = player;
    this.player.ship = this;
    // place player ship at the bottom in the middle
    pos.y = gameContext.canvas.height - HEIGHT;
    pos.x = (gameContext.canvas.width / 2) - (WIDTH / 2);

    document.on.keyDown.add((KeyboardEvent e) {

      int action = e.keyCode;
      if (action == KEY_LEFT) {
        translate(-1, 0);
      } else if (action == KEY_RIGHT) {
        translate(1, 0);
      } else if (action == KEY_SPACE) {
        if (lastShoot == 0 || lastShoot < Util.currentTimeMillis() - SHOOT_RATE_MILLIS ) {
          lastShoot = Util.currentTimeMillis();
          Missile missile = new Missile(gameContext, player, pos.x + 6, pos.y - 7, 40);
          parent.addChild(missile);
        }
      }
    });
  }

  bool takeHitFrom(Weapon weapon) {
      return player.takeHitFrom(weapon);
  }

}
