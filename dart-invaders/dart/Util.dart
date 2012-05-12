class Util {
  static int currentTimeMillis() {
    return (new Date.now()).value;
  }

  static int findMin(List l, int valueFunc(Object o)) {
    int min = 9999999;
    for (var c in l) {
      int cmin = valueFunc(c);
      if (cmin < min) {
        min = cmin;
      }
    }
    return min;
  }

  static int findMax(List l, int valueFunc(Object o)) {
    int max = -9999999;
    for (var c in l) {
      int cmax = valueFunc(c);
      if (cmax > max) {
        max = cmax;
      }
    }
    return max;
  }

  static double toRad(int deg) {
    return deg * Math.PI / 180;
  }

  /* attempt to compensate for the fact that dart's Math.random() is unbelievably bad
  http://code.google.com/p/dart/issues/detail?id=499&q=random&colspec=ID%20Type%20Status%20Priority%20Area%20Milestone%20Owner%20Summary */
  static double random() {
    double rnd = ((currentTimeMillis() % 1000) * Math.random()) / 500;
    if (rnd > 1.0) {
      rnd = rnd-0.5;
    }
    return rnd;
  }
}
