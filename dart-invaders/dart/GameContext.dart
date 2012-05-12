
class GameContext {

  CanvasRenderingContext2D ctx;
  CanvasElement canvas;
  GameSounds gameSounds;

  GameContext() {
    this.canvas = document.query('#game-canvas');
    this.ctx = canvas.getContext("2d");
    this.gameSounds = new GameSounds();
  }
}
