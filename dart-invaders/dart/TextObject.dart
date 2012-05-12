class TextObject extends GameObject{

  String text;
  String colour;
  String fontStyle;

  TextObject(GameContext gameContext, String this.text, String this.colour, String this.fontStyle, int x, int y) : super(gameContext, x, y, 0, 0) {
  }

  void paint() {
    gameContext.ctx.fillStyle = colour;
    gameContext.ctx.font = fontStyle;
    gameContext.ctx.textBaseline = 'bottom';
    gameContext.ctx.fillText(text, pos.x, pos.y);
  }
}
