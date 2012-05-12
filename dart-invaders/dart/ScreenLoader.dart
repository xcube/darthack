/* Load a screen from a file*/
class ScreenLoader {
  static GameScreen loadScreen(GameContext gameContext, String levelFile) {
    GameScreen gameScreen = new GameScreen(gameContext);
    XMLHttpRequest xhr = new XMLHttpRequest();
    xhr.open("GET", levelFile, true);
    xhr.on.load.add((e) {
      var jsonStr = xhr.responseText;
      var jsonObj = JSON.parse(jsonStr);

    });
    xhr.send();

    return gameScreen;
  }
}
