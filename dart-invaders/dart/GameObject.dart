
class GameObject {

  int x, y;
  int width, height;
  CanvasRenderingContext2D ctx;
  

  GameObject(int this.x, int this.y, int this.width, int this.height) {
    
    CanvasElement canvas = document.query('#game-canvas');
    this.ctx = canvas.getContext("2d");
  }

  void paint() {
    
  }

  void tick(delta) {
    
  }

  bool collide(GameObject gameObject) {
    // TODO
  }

  bool within(GameObject gameObject) {
    // TODO
  }
}
