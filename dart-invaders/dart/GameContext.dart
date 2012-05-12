
class GameContext {

  CanvasRenderingContext2D ctx;
  CanvasElement canvas;
  Player player;
  GameScreen screen;
  GameSounds gameSounds;

  GameContext(Player player, GameSounds this.gameSounds) {
    this.canvas = document.query('#game-canvas');
    this.ctx = canvas.getContext("2d");
    this.player = player;
    player.gameContext = this;
  }

  PlayerShip getPlayerShip() {
    return player.ship;
  }

  GameScreen getScreen() {
    return screen;
  }
}
