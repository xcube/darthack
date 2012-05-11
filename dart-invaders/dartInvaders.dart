#import('dart:html');

class dartInvaders {

  dartInvaders() {
  }

  void run() {
    write("Hello World!");
  }

  void write(String message) {
    // the HTML library defines a global "document" variable
    document.query('#status').innerHTML = message;
  }
}

void main() {
  new dartInvaders().run();
}
