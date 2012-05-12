interface Container {

  bool hasChildren();

  List<GameObject> getChildren();

  void addChild(GameObject gameObject);

  void removeChild(GameObject gameObject);

  int findChild(GameObject gameObject);

  void paintChildren();

  void tickChildren(double delta);
}
