
class GameContext {

  CanvasRenderingContext2D ctx;
  CanvasElement canvas;

  GameContext() {
    this.canvas = document.query('#game-canvas');
    this.ctx = canvas.getContext("2d");
  }
}
