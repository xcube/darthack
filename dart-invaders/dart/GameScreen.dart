
class GameScreen extends GameObject {
  
  bool showRefreshRate;
  
  GameScreen() : super(0, 0, 800, 600) {
    this.showRefreshRate = false;
  }
  
  GameScreen.Options(bool this.showRefreshRate) : super(0, 0, 800, 600) {
  }

  void paint() {
    ctx.beginPath();
    ctx.clearRect(0, 0, width, height);
    ctx.fillStyle = '#ffffff';
    ctx.strokeStyle = '#000000';
    ctx.fillRect(0, 0, width, height);
    
    ctx.rect(0, 0, width, height);
    ctx.fillStyle = '#000000';
    ctx.fill();
    ctx.stroke();
    ctx.closePath();
  }

  void tick(delta) {
    
  }
}
