
class GameScreen extends GameObject implements Container {
  
  bool showRefreshRate;
  List<GameObject> children;
  
  GameScreen(GameContext gameContext) : super(gameContext, 0, 0, 800, 600) {
    this.showRefreshRate = false;
    this.children = new List<GameObject>();
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
    for(GameObject child in children) {
      child.paint();
    }
  }

  void tick(delta) {
    
  }
  
  bool hasChildren() {
    return children.length > 0;
  }
  
  void addChild(GameObject gameObject) {
    this.children.add(gameObject);
  }
}
