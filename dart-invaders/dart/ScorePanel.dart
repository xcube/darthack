class ScorePanel extends GameObject {

  Player player;
  int lastTextX;

  ScorePanel(GameContext gameContext, Player currentPlayer) : super(gameContext, 0, 0, 800, 50) {
    this.player = currentPlayer;
    this.lastTextX = 0;
  }

  void paint() {
    paintScoreBox();
    paintText("Lives: "+player.lives);
    paintText("Energy: "+player.energy);
    paintText("Score: "+player.score);
    lastTextX = 0;
  }

  void paintScoreBox() {
    gameContext.ctx.beginPath();
    gameContext.ctx.clearRect(0, 0, width, height);

    gameContext.ctx.rect(pos.x, pos.y, width, height);
    gameContext.ctx.fillStyle = '#030303';
    gameContext.ctx.fill();
    gameContext.ctx.stroke();
    gameContext.ctx.closePath();
  }

  void paintText(String text) {
    gameContext.ctx.fillStyle = '#60AFFE';
    gameContext.ctx.font = 'bold 12px sans-serif';
    gameContext.ctx.textBaseline = 'bottom';
    gameContext.ctx.fillText(text, lastTextX + (text.length+1 * 12), 25);
    lastTextX += (text.length * 12);
  }
}
