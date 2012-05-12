
class Ship extends GameObject {

  ImageElement sprite;

  Ship(GameContext gameContext, int x, int y, int width, int height, String bitmap) : super(gameContext, x, y, width, height) {
    if(null != bitmap && bitmap.trim().length > 0) {
      loadBitmap(bitmap);
    }
  }

  void paint() {
    if(null == sprite) {
      gameContext.ctx.beginPath();
      gameContext.ctx.clearRect(pos.x, pos.y, width, height);

      gameContext.ctx.rect(pos.x, pos.y, width, height);
      gameContext.ctx.strokeStyle = '#99cc33';
      gameContext.ctx.stroke();
      gameContext.ctx.closePath();
    } else {
      gameContext.ctx.drawImage(sprite, pos.x, pos.y);

    }
  }

  void loadBitmap(String file) {
    this.sprite = new Element.tag('img');
    this.sprite.src = file;
  }

}
