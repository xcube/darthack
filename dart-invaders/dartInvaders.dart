#import('dart:html');
#source('dart/GameObject.dart');
#source('dart/MovingObject.dart');
#source('dart/GameScreen.dart');
#source('dart/Ship.dart');
#source('dart/PlayerShip.dart');
#source('dart/Container.dart');


class dartInvaders {

  static final int REFRESH_INTERVAL = 250;

  int frameCount = 1;
  GameScreen gameScreen;

  dartInvaders() {
    gameScreen = new GameScreen();
    gameScreen.addChild(new PlayerShip());
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
