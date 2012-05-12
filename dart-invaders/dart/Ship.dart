
class Ship extends GameObject {

  Ship(GameContext gameContext, int x, int y, int width, int height) : super(gameContext, x, y, width, height) {

  }

  void paint() {
    gameContext.ctx.beginPath();
    gameContext.ctx.clearRect(pos.x, pos.y, width, height);

    gameContext.ctx.rect(pos.x, pos.y, width, height);
    gameContext.ctx.strokeStyle = '#99cc33';
    gameContext.ctx.stroke();
    gameContext.ctx.closePath();
  }

  void rotate(num deg) {
    gameContext.ctx.rotate(Util.toRad(deg));
  }

  void translate(int xUnits, yUnits) {
    pos.x += xUnits;
    pos.y += yUnits;
  }

}
