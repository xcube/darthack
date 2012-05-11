class MovingObject extends GameObject {
  
  Point delta; // speed in units/second
  List<Point> path;
  int pathIndex;
  double pathSpeed;
  double timeToNextPoint;
  
  MovingObject(x, y, width, height, Point delta) : super(x, y, width, height) {
    this.delta = new Point(delta.x, delta.y);
    this.path = null;
  }
  
  MovingObject.path(width, height, List<Point> wayPoints, double speed) {
    this.path = wayPoints;
    this.pathSpeed = speed;
    this.pathIndex = 1;
    this.pos.x = path[0].x;
    this.pos.y = path[0].y;
    nextPathElement(path[1]);
  }
  
  void tick(timeSinceLastTick) {
    pos.x += timeSinceLastTick * delta.x;
    pos.y += timeSinceLastTick * delta.y;
    
    if (null != path) {
      timeToNextPoint -= timeSinceLastTick;
      if (timeToNextPoint < 0) {
        ++pathIndex;
        nextPathElement(path[pathIndex]);
      }
    }
  }
  
  void nextPathElement(Point step) {
    double dx = pos.x - step.x;
    double dy = pos.y - step.y;
    double dist = Math.sqrt((dx*dx) + (dy*dy));
    timeToNextPoint = dist / pathSpeed;
    delta.x = dx / timeToNextPoint;
    delta.y = dy / timeToNextPoint;
  }
}
