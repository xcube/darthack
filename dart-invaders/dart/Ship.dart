
class Ship extends GameObject {

  Ship(GameContext gameContext, int x, int y, int width, int height) : super(gameContext, x, y, width, height) {
  }

  void paint() {
    gameContext.ctx.beginPath();
    gameContext.ctx.clearRect(0, 0, width, height);

    gameContext.ctx.rect(pos.x, pos.y, width, height);
    gameContext.ctx.strokeStyle = '#99cc33';
    gameContext.ctx.stroke();
    gameContext.ctx.closePath();
  }

  void rotate(num deg, int dir) {
    gameContext.ctx.rotate(Util.toRad(deg));
  }

}
