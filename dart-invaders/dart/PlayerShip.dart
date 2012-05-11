
class PlayerShip extends GameObject {

  static final WIDTH = 50;
  static final HEIGHT = 50;

  PlayerShip() : super(0, 0, WIDTH, HEIGHT) {

    // place player ship at the bottom in the middle
    y = canvas.height - HEIGHT;
    x = (canvas.width / 2) - (WIDTH / 2);

    ctx.on.keyDown.add((Event e) {
      // TODO - check what key was pressed
      x++;
      paint();
    }, true);
  }

}
