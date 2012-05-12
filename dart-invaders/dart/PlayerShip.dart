
class PlayerShip extends Ship {

  static final int WIDTH = 32;
  static final int HEIGHT = 32;
  static final int KEY_LEFT = 37;
  static final int KEY_RIGHT = 39;
  static final int KEY_SPACE = 32;
  static final int MOVE_PIXELS = 3;

  // time when the last missile was fired
  int lastShoot = 0;
  int lastPaint = 0;
  static final int BLINK_RATE_MILIS = 1 * 1000;
  static final int SHOOT_RATE_MILLIS = 1 * 1000;
  Player player;

  PlayerShip(GameContext gameContext, Player player) : super(gameContext, 0, 0, WIDTH, HEIGHT, 'img/Space Invaders 1.png') {
    this.player = player;
    this.player.ship = this;
    this.lastPaint = 0;
    // place player ship at the bottom in the middle
    pos.y = gameContext.canvas.height - HEIGHT;
    pos.x = (gameContext.canvas.width / 2) - (WIDTH / 2);

    document.on.keyDown.add((KeyboardEvent e) {

      int action = e.keyCode;
      if (action == KEY_LEFT) {
        translate(-MOVE_PIXELS, 0);
      } else if (action == KEY_RIGHT) {
        translate(MOVE_PIXELS, 0);
      } else if (action == KEY_SPACE) {
        if (lastShoot == 0 || lastShoot < Util.currentTimeMillis() - SHOOT_RATE_MILLIS ) {
          lastShoot = Util.currentTimeMillis();
          Missile missile = new Missile(gameContext, player, pos.x + 6, pos.y - 7, 40);
          parent.addChild(missile);
        }
      }
    });
  }

  void paint() {
    if(player.hasLowEnergy() && (lastPaint == 0 || lastPaint > Util.currentTimeMillis() - BLINK_RATE_MILIS)) {
        print('Hidding ship....');
        gameContext.ctx.beginPath();
        gameContext.ctx.clearRect(pos.x, pos.y, width, height);

        gameContext.ctx.rect(pos.x, pos.y, width, height);
        gameContext.ctx.strokeStyle = '#99cc33';
        gameContext.ctx.stroke();
        gameContext.ctx.closePath();
    } else {
      super.paint();
    }
    lastPaint = Util.currentTimeMillis();;
  }

  bool takeHitFrom(Weapon weapon) {
      return player.takeHitFrom(weapon);
  }

}
