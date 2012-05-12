#import('dart:html');
#source('dart/GameObject.dart');
#source('dart/Container.dart');
#source('dart/ContainerImpl.dart');
#source('dart/MovingObject.dart');
#source('dart/AnimatedImageObject.dart');
#source('dart/GameScreen.dart');
#source('dart/Ship.dart');
#source('dart/AlienShip.dart');
#source('dart/PlayerShip.dart');
#source('dart/GameContext.dart');
#source('dart/Util.dart');


class dartInvaders {

  static final int REFRESH_INTERVAL = 25;

  int frameCount = 1;
  GameScreen gameScreen;
  int lastTime;

  dartInvaders() {
    GameContext gameContext = new GameContext();
    lastTime = Util.currentTimeMillis();

    gameScreen = new GameScreen(gameContext);
    PlayerShip playerShip = new PlayerShip(gameContext);
    gameScreen.addChild(playerShip);

    List<Point> alienPath = [new Point(100, 100), new Point(300, 50), new Point(400, 100), new Point(450, 150),  new Point(400, 200),
                             new Point(300, 250), new Point(50, 200)];
    AlienShip alien = new AlienShip(gameContext, 10, 10, alienPath, 25.0, 'img/Space Invaders 2.png');
    alien.setPathEndBehaviour(MovingObject.PATH_END_REPEAT);
    gameScreen.addChild(alien);
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
