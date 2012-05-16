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
#source('dart/TextObject.dart');
#source('dart/ScreenLoader.dart');

class dartInvaders {

  static final int REFRESH_INTERVAL = 25;
  static final int COUNTDOWN_AMOUNT = 100;

  int frameCount = 1;
  GameContext gameContext;
  GameScreen gameScreen;
  int lastTime;
  int currentLevel;
  bool levelChange;
  int levelCountdown;
  GameObject banner;
  List<String> levels;

  dartInvaders() {
    currentLevel = 0;
    levelChange = false;
    levelCountdown = 0;
    banner = null;
    levels = [ "resources/level1.json", "resources/level2.json" ];
    Player player = new Player(3, 130);

    GameSounds gameSounds = new GameSounds();
    gameContext = new GameContext(player, gameSounds);
    lastTime = Util.currentTimeMillis();

    gameScreen = ScreenLoader.loadScreen(gameContext, levels[currentLevel]);

    PlayerShip playerShip = new PlayerShip(gameContext, player);
    ScorePanel scorePanel = new ScorePanel(gameContext, player);
    gameScreen.addChild(scorePanel);
    gameScreen.addChild(playerShip);
  }

  void startGame() {
    window.setInterval(f() => update(), REFRESH_INTERVAL);
  }

  void update() {
    ++frameCount;
    int now = Util.currentTimeMillis();
    double delta = Math.min((now - lastTime) / 1000.0, 0.1);
    lastTime = now;
    if(levelChange && levelCountdown < 0) {
      print("About to change level...");
    }
    gameScreen.tick(delta);

    if (levelChange) {
      --levelCountdown;
      if (levelCountdown < 0) {
        if (null != banner) {
          gameScreen.removeChild(banner);
          banner = null;
        }
        ScreenLoader.loadNewLevel(gameContext, gameScreen, levels[currentLevel]);
        levelChange = false;
      }
    } else {
      if (gameScreen.hasLoaded && (0 == aliensRemaining())) {
        ++currentLevel;
        if (currentLevel == levels.length) {
          // game complete
          gameContext.player.gameOver("YOU WON!!! :-)");
        } else {
          levelChange = true;
          levelCountdown = COUNTDOWN_AMOUNT;

          int centerX = (screen.width / 2) - 150;
          int centerY = screen.height / 2;
          banner = new TextObject(gameContext, "LEVEL ${currentLevel+1}", '#CD2626', 'bold 48px sans-serif', centerX, centerY);
          gameScreen.addChild(banner);
        }
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
