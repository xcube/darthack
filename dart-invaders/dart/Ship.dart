
class Ship extends GameObject {

  Ship(int x, int y, int width, int height) : super(x, y, width, height) {
  }
  
  void paint() {
    ctx.beginPath();
    ctx.clearRect(0, 0, width, height);
    ctx.fillStyle = '#ffffff';
    ctx.strokeStyle = '#000000';
    ctx.fillRect(pos.x, pos.y, width, height);
    
    ctx.rect(pos.x, pos.y, width, height);
    ctx.fillStyle = '#99cc33';
    ctx.fill();
    ctx.stroke();
    ctx.closePath();
  }
  
}
