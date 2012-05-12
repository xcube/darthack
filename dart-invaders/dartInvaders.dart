#import('dart:html');
#source('dart/GameObject.dart');
#source('dart/MovingObject.dart');
#source('dart/GameScreen.dart');
#source('dart/Ship.dart');
#source('dart/PlayerShip.dart');
#source('dart/Container.dart');
#source('dart/GameContext.dart');


class dartInvaders {

  static final int REFRESH_INTERVAL = 250;

  int frameCount = 1;
  GameScreen gameScreen;

  dartInvaders() {
    GameContext gameContext = new GameContext();

    gameScreen = new GameScreen(gameContext);
    PlayerShip playerShip = new PlayerShip(gameContext);
    gameScreen.addChild(playerShip);
  }

  void startGame() {
    window.setInterval(f() => update(), REFRESH_INTERVAL);
  }

  void update() {
    write((++frameCount).toString());
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
