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
}
