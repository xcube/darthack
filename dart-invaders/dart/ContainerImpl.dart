class ContainerImpl extends GameObject implements Container {
  List<GameObject> children;

  ContainerImpl(GameContext gameContext, int x, int y, int width, int height) : super(gameContext, x, y, width, height) {
    this.children = new List<GameObject>();
  }

  bool hasChildren() {
    return children.length > 0;
  }

  List<GameObject> getChildren() {
    return children;
  }

  int findChild(GameObject gameObject) {
    int index = -1;
    for (int x=0; x<children.length; ++x) {
      if (children[x] === gameObject) {
        index = x;
        break;
      }
    }
    return index;
  }

  void addChild(GameObject gameObject) {
    this.children.add(gameObject);
    gameObject.parent = this;
  }

  void removeChild(GameObject gameObject) {
    int childIndex = findChild(gameObject);
    if (-1 != childIndex) {
      children.removeRange(childIndex, 1);
      gameObject.parent = null;
    }
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
    return Util.findMin(children, (c) => c.minX());
  }
  int maxX() {
    return Util.findMax(children, (c) => c.maxX());
  }
  int minY() {
    return Util.findMin(children, (c) => c.minY());
  }
  int maxY() {
    return Util.findMin(children, (c) => c.minX());
  }
}
