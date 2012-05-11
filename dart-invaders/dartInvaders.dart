#import('dart:html');
#source('dart/GameObject.dart');
#source('dart/GameScreen.dart');
#source('dart/Ship.dart');
#source('dart/PlayerShip.dart');


class dartInvaders {

  static final int REFRESH_INTERVAL = 250;

  int frameCount = 1;
  List<GameObject> gameObjects;
  GameObject frame;

  dartInvaders() {
    gameObjects = new List<GameObject>();
    frame = new GameObject();
  }

  void startGame() {
    window.setInterval(f() => update(), REFRESH_INTERVAL);
  }

  void update() {
    write((++frameCount).toString());
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
