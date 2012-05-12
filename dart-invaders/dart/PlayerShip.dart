
class PlayerShip extends Ship {

  static final int WIDTH = 32;
  static final int HEIGHT = 32;
  static final int KEY_LEFT = 37;
  static final int KEY_RIGHT = 39;
  static final int KEY_SPACE = 32;

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
//        Bomb bomb = new Bomb(gameContext, pos.x + 16, pos.y + 20, 40);
//        parent.addChild(bomb);
      }
    });
  }

  void takeHitFrom(Weapon weapon) {
      player.takeHitFrom(weapon);
  }

}
