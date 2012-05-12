class ContainerImpl extends GameObject implements Container {
  List<GameObject> children;
  
  ContainerImpl(GameContext gameContext, int x, int y, int width, int height) : super(gameContext, x, y, width, height) {
    this.children = new List<GameObject>();
  }
  
  bool hasChildren() {
    return children.length > 0;
  }
  
  void addChild(GameObject gameObject) {
    this.children.add(gameObject);
  }
  
  void paintChildren() {
    for(GameObject child in children) {
      child.paint();
    }
  }
  
  void tickChildren(double delta) {
    for(GameObject child in children) {
      child.tick(delta);
    }
  }
  
  int minX() {
    int min = -1;
    for (GameObject c in children) {
      int cmin = c.minX();
      if (cmin < min) {
        min = cmin;
      }
    }
    return min;
  }
  
  int maxX() {
    
  }
  int minY() {
    
  }
  int maxY() {
    
  }
}
