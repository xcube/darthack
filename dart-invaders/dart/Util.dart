class Util {
  static int currentTimeMillis() {
    return (new Date.now()).value;
  }
  
  static int findMin(List l, valueFunc) {
    int min = 9999999;
    for (var c in l) {
      int cmin = valueFunc(c);
      if (cmin < min) {
        min = cmin;
      }
    }
    return min;
  }
  
  static int findMax(List l, valueFunc) {
    int max = -9999999;
    for (var c in l) {
      int cmax = valueFunc(c);
      if (cmax > max) {
        max = cmax;
      }
    }
    return max;
  }
}
