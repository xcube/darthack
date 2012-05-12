#import('dart:html');
#source('dart/GameObject.dart');
#source('dart/Container.dart');
#source('dart/ContainerImpl.dart');
#source('dart/MovingObject.dart');
#source('dart/GameScreen.dart');
#source('dart/Ship.dart');
#source('dart/AlienShip.dart');
#source('dart/PlayerShip.dart');
#source('dart/GameContext.dart');
#source('dart/Util.dart');
#source('dart/Player.dart');
#source('dart/Weapon.dart');
#source('dart/ScorePanel.dart');


class dartInvaders {

  static final int REFRESH_INTERVAL = 250;

  int frameCount = 1;
  GameScreen gameScreen;
  int lastTime;

  dartInvaders() {
    GameContext gameContext = new GameContext();
    lastTime = Util.currentTimeMillis();

    gameScreen = new GameScreen(gameContext);
    Player player = new Player(gameContext);
    PlayerShip playerShip = new PlayerShip(gameContext, player);
    ScorePanel scorePanel = new ScorePanel(gameContext, player);
    gameScreen.addChild(scorePanel);
    gameScreen.addChild(playerShip);
  }

  void startGame() {
    window.setInterval(f() => update(), REFRESH_INTERVAL);
  }

  void update() {
    write((++frameCount).toString());
    int now = Util.currentTimeMillis();
    double delta = Math.min((now - lastTime) / 1000.0, 0.1);
    lastTime = now;
    gameScreen.tick(delta);
    gameScreen.paint();

  }

  void run() {
    startGame();
  }

  void write(String message) {
    // the HTML library defines a global "document" variable
    document.query('#status').innerHTML = message;
  }
}

void main() {
  new dartInvaders().run();
}
