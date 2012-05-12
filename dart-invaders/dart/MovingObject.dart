class MovingObject extends GameObject {

  static final int PATH_END_STOP = 1;
  static final int PATH_END_REPEAT = 2;
  static final int PATH_END_REMOVE = 3;

  Point delta; // speed in units/second
  List<Point> path;
  int pathIndex;
  double pathSpeed;
  double timeToNextPoint = 0.0;
  int pathEndBehaviour;
  bool moving;

  MovingObject(GameContext gameContext, int x, int y, int width, int height, Point delta) : super(gameContext, x, y, width, height) {
    this.delta = new Point(delta.x, delta.y);
    this.path = null;
    this.pathEndBehaviour = PATH_END_STOP;
    this.moving = true;
  }

  MovingObject.path(GameContext gameContext, int width, int height, List<Point> wayPoints, double speed) : super(gameContext, 0, 0, width, height) {
    this.delta = new Point(0, 0);
    this.path = wayPoints;
    this.pathSpeed = speed;
    this.pathIndex = 1;
    this.pos.x = path[0].x;
    this.pos.y = path[0].y;
    nextPathElement(path[1]);
    this.pathEndBehaviour = PATH_END_STOP;
    this.moving = true;
  }

  void tick(double timeSinceLastTick) {
    if (moving) {
      pos.x += timeSinceLastTick * delta.x;
      pos.y += timeSinceLastTick * delta.y;

      if (null != path) {
        timeToNextPoint -= timeSinceLastTick;
        if (timeToNextPoint < 0) {
          ++pathIndex;
          if (pathIndex >= path.length) {
            pathEnd(); // handle end of path behavior
            // if we are still moving, then loop to beginning of path
            if (moving) {
              nextPathElement(path[0]);
            }
          } else {
            nextPathElement(path[pathIndex]);
          }
        }
      }
    }
  }

  void nextPathElement(Point step) {
    if (!moving) {
      return;
    }

    double dx = pos.x - step.x;
    double dy = pos.y - step.y;
    double dist = Math.sqrt((dx*dx) + (dy*dy));
    timeToNextPoint = dist / pathSpeed;
    delta.x = dx / timeToNextPoint;
    delta.y = dy / timeToNextPoint;
  }

  /* called when object reaches the end of its path, sub-classes can override for more complec behaviour*/
  void pathEnd() {
    switch (pathEndBehaviour) {
      case PATH_END_STOP:
        moving = false;
        break;
      case PATH_END_REPEAT:
        pathIndex = 0;
        break;
      case PATH_END_REMOVE:
        this.moving = false;
        remove();
        break;
    }
  }
}
