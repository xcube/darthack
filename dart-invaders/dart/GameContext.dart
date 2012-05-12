
class GameContext {

  CanvasRenderingContext2D ctx;
  CanvasElement canvas;
  Player player;
  GameScreen screen;

  GameContext(Player player) {
    this.canvas = document.query('#game-canvas');
    this.ctx = canvas.getContext("2d");
    this.player = player;
  }

  PlayerShip getPlayerShip() {
    return player.ship;
  }

  GameScreen getScreen() {
    return screen;
  }
}
