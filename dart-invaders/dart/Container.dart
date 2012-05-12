interface Container {
  
  bool hasChildren();
  
  void addChild(GameObject gameObject);
  
  void removeChild(GameObject gameObject);
  
  int findChild(GameObject gameObject);
  
  void paintChildren();
  
  void tickChildren(double delta);
}
