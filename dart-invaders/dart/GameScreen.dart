
class GameScreen extends GameObject implements Container {
  
  bool showRefreshRate;
  List<GameObject> children;
  
  GameScreen() : super(0, 0, 800, 600) {
    this.showRefreshRate = false;
    this.children = new List<GameObject>();
  }
  
  GameScreen.Options(bool this.showRefreshRate) : super(0, 0, 800, 600) {
    this.children = new List<GameObject>();
  }

  void paint() {
    ctx.beginPath();
    ctx.clearRect(0, 0, width, height);
    ctx.fillStyle = '#ffffff';
    ctx.strokeStyle = '#000000';
    ctx.fillRect(pos.x, pos.y, width, height);
    
    ctx.rect(pos.x, pos.y, width, height);
    ctx.fillStyle = '#000000';
    ctx.fill();
    ctx.stroke();
    ctx.closePath();
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
