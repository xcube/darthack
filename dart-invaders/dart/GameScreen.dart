
class GameScreen extends ContainerImpl  {

  static final int GAME_WIDTH = 800;
  static final int GAME_HEIGHT = 600;

  bool showRefreshRate;
  bool hasLoaded = false;

  GameScreen(GameContext gameContext) : super(gameContext, 0, 0, GAME_WIDTH, GAME_HEIGHT) {
    this.showRefreshRate = false;
    gameContext.screen = this;
  }

  GameScreen.Options(GameContext gameContext, bool this.showRefreshRate) : super(gameContext, 0, 0, GAME_WIDTH, GAME_HEIGHT) {
  }

  void paint() {
    gameContext.ctx.beginPath();
    gameContext.ctx.clearRect(0, 0, width, height);
    gameContext.ctx.fillStyle = '#ffffff';
    gameContext.ctx.strokeStyle = '#000000';
    gameContext.ctx.fillRect(pos.x, pos.y, width, height);

    gameContext.ctx.rect(pos.x, pos.y, width, height);
    gameContext.ctx.fillStyle = '#000000';
    gameContext.ctx.fill();
    gameContext.ctx.stroke();
    gameContext.ctx.closePath();

    paintChildren();
  }

  void tick(delta) {
    tickChildren(delta);
  }

  void rotate(num deg) {
    // Do nothing
  }

  void translate(int xUnits, int yUnits) {
    // Do nothing
  }



}
