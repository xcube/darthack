#import('dart:html');
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


class dartInvaders {

  static final int REFRESH_INTERVAL = 25;

  int frameCount = 1;
  GameScreen gameScreen;
  int lastTime;

  dartInvaders() {
    Player player = new Player();
    GameContext gameContext = new GameContext(player);
    lastTime = Util.currentTimeMillis();

    gameScreen = new GameScreen(gameContext);

    PlayerShip playerShip = new PlayerShip(gameContext, player);
    ScorePanel scorePanel = new ScorePanel(gameContext, player);
    gameScreen.addChild(scorePanel);
    gameScreen.addChild(playerShip);

    List<Point> alienPath = [new Point(100, 100), new Point(300, 50), new Point(400, 100), new Point(450, 150),  new Point(400, 200),
                             new Point(300, 250), new Point(50, 200)];
    AlienShip alien = new AlienShip(gameContext, 48, 48, alienPath, 25.0, 'img/Space Invaders 2.png', 25);
    alien.setPathEndBehaviour(MovingObject.PATH_END_REPEAT);
    gameScreen.addChild(alien);

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
    gameScreen.paint();

  }

  void run() {
    startGame();
  }

}

void main() {
  new dartInvaders().run();
}
