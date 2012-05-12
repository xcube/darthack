/* Load a screen from a file*/
class ScreenLoader {
  static GameScreen loadScreen(GameContext gameContext, String levelFile) {
    GameScreen gameScreen = new GameScreen(gameContext);
    loadNewLevel(gameContext, gameScreen, levelFile);
    return gameScreen;
  }

  static loadNewLevel(GameContext gameContext, GameScreen gameScreen, String levelFile) {
    gameScreen.hasLoaded = false;

    XMLHttpRequest xhr = new XMLHttpRequest();
    xhr.open("GET", levelFile, true);
    xhr.on.load.add((e) {
      var jsonStr = xhr.responseText;
      var jsonObj = JSON.parse(jsonStr);
      var aliensDesc = jsonObj["aliens"];

      for (var ad in aliensDesc) {
        String img = ad["image"];
        int speed = ad["speed"];
        int points = ad["points"];
        List pathDesc = ad["path"];
        List<Point> alienPath = new List<Point>();
        for (var ps in pathDesc) {
          Point p = new Point(ps[0], ps[1]);
          alienPath.add(p);
        }

        AlienShip alien = new AlienShip(gameContext, 48, 48, alienPath, speed, img, points);
        alien.setPathEndBehaviour(MovingObject.PATH_END_REPEAT);
        gameScreen.addChild(alien);
      }
      gameScreen.hasLoaded = true;
    });
    xhr.send();
  }
}
