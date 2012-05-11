
class Ship extends GameObject {

  Ship() : super(0, 0, 24, 24) {
    
  }
  
  void paint() {
    ctx.beginPath();
    ctx.clearRect(0, 0, width, height);
    ctx.fillStyle = '#ffffff';
    ctx.strokeStyle = '#000000';
    ctx.fillRect(x, y, width, height);
    
    ctx.rect(x, y, width, height);
    ctx.fillStyle = '#99cc33';
    ctx.fill();
    ctx.stroke();
    ctx.closePath();
  }
  
}
