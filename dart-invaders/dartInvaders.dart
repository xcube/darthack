#import('dart:html');
#source('dart/GameObject.dart');
#source('dart/Container.dart');
#source('dart/ContainerImpl.dart');
#source('dart/MovingObject.dart');
#source('dart/GameScreen.dart');
#source('dart/Ship.dart');
#source('dart/PlayerShip.dart');
#source('dart/Util.dart');


class dartInvaders {

  static final int REFRESH_INTERVAL = 250;

  int frameCount = 1;
  GameScreen gameScreen;
  int lastTime;

  dartInvaders() {
    lastTime = Util.currentTimeMillis();
    gameScreen = new GameScreen();
    gameScreen.addChild(new PlayerShip());
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
