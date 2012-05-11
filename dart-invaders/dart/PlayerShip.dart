
class PlayerShip extends Ship {

  static final WIDTH = 50;
  static final HEIGHT = 50;

  PlayerShip() : super(0, 0, WIDTH, HEIGHT) {

    // place player ship at the bottom in the middle
    pos.y = canvas.height - HEIGHT;
    pos.x = (canvas.width / 2) - (WIDTH / 2);

    canvas.on.keyDown.add((Event e) {
      // TODO - check what key was pressed
      x++;
      paint();
    }, true);
  }

}
