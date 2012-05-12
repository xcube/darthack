#import('dart:html');
#import('dart:json');
#source('dart/GameObject.dart');
#source('dart/Container.dart');
#source('dart/ContainerImpl.dart');
#source('dart/MovingObject.dart');
#source('dart/GameScreen.dart');
#source('dart/Ship.dart');
#source('dart/AnimatedImageObject.dart');
#source('dart/PathAnimatedImageObject.dart');
#source('dart/Bomb.dart');
#source('dart/Explosion.dart');
#source('dart/AlienShip.dart');
#source('dart/PlayerShip.dart');
#source('dart/GameContext.dart');
#source('dart/Util.dart');
#source('dart/GameSounds.dart');
#source('dart/Player.dart');
#source('dart/Weapon.dart');
#source('dart/ScorePanel.dart');
#source('dart/Missile.dart');
#source('dart/ScreenLoader.dart');

class dartInvaders {

  static final int REFRESH_INTERVAL = 25;

  int frameCount = 1;
  GameContext gameContext;
  GameScreen gameScreen;
  int lastTime;
  int currentLevel;
  List<String> levels;

  dartInvaders() {
    currentLevel = 0;
    levels = [ "resources/level1.json" ];
    Player player = new Player();
    gameContext = new GameContext(player);
    lastTime = Util.currentTimeMillis();

    gameScreen = ScreenLoader.loadScreen(gameContext, levels[currentLevel]);

    PlayerShip playerShip = new PlayerShip(gameContext, player);
    ScorePanel scorePanel = new ScorePanel(gameContext, player);
    gameScreen.addChild(scorePanel);
    gameScreen.addChild(playerShip);

    Explosion exp = new Explosion(gameContext, 400, 300);
    gameScreen.addChild(exp);
  }

  void startGame() {
    window.setInterval(f() => update(), REFRESH_INTERVAL);
  }

  void update() {
    ++frameCount;
    int now = Util.currentTimeMillis();
    double delta = Math.min((now - lastTime) / 1000.0, 0.1);
    lastTime = now;
    gameScreen.tick(delta);

    if (0 == aliensRemaining()) {
      ++currentLevel;
      if (currentLevel == levels.length) {
        // game complete
        gameContext.player.gameOver("YOU WON!!! :-)");
      }
    }

    gameScreen.paint();

  }

  int aliensRemaining() {
    int count = 0;
    for (GameObject x in gameScreen.getChildren()) {
      if (x is AlienShip) {
        ++count;
      }
    }
    return count;
  }

  void run() {
    startGame();
  }

}

void main() {
  new dartInvaders().run();
}
