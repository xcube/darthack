
class GameScreen extends ContainerImpl  {
  
  bool showRefreshRate;
  
  GameScreen(GameContext gameContext) : super(gameContext, 0, 0, 800, 600) {
    this.showRefreshRate = false;
  }
  
  GameScreen.Options(GameContext gameContext, bool this.showRefreshRate) : super(gameContext, 0, 0, 800, 600) {
    this.children = new List<GameObject>();
  }

  void paint() {
    gameContext.ctx.beginPath();
    gameContext.ctx.clearRect(0, 0, width, height);
    gameContext.ctx.fillStyle = '#ffffff';
    gameContext.ctx.strokeStyle = '#000000';
    gameContext.ctx.fillRect(pos.x, pos.y, width, height);

    gameContext.ctx.rect(pos.x, pos.y, width, height);
    gameContext.ctx.fillStyle = '#000000';
    gameContext.ctx.fill();
    gameContext.ctx.stroke();
    gameContext.ctx.closePath();
    
    paintChildren();
  }

  void tick(delta) {
    tickChildren(delta);
  }
  

  

}
