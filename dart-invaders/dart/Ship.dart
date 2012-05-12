
class Ship extends GameObject {

  Ship(GameContext gameContext, int x, int y, int width, int height) : super(gameContext, x, y, width, height) {
  }
  
  void paint() {
    gameContext.ctx.beginPath();
    gameContext.ctx.clearRect(0, 0, width, height);
    gameContext.ctx.fillStyle = '#ffffff';
    gameContext.ctx.strokeStyle = '#000000';
    gameContext.ctx.fillRect(pos.x, pos.y, width, height);
    
    gameContext.ctx.rect(pos.x, pos.y, width, height);
    gameContext.ctx.fillStyle = '#99cc33';
    gameContext.ctx.fill();
    gameContext.ctx.stroke();
    gameContext.ctx.closePath();
  }
  
}
