class Player {

  int score;
  int lives;
  int energy;
  List<Weapon> weapons;
  PlayerShip ship;
  GameContext gameContext;

  Player() {
    this.score = 0;
    this.lives = 1;
    this.energy = 25;
    this.weapons = new List<Weapon>();
  }

  void addWeapon(Weapon weapon) {
    this.weapons.add(weapon);
  }

  /* Return true if player lost a life, false otherwise. */
  bool takeHitFrom(Weapon weapon) {
    int energyAfterHit = energy - weapon.getDamage();
    print("Energy after hit : "+energyAfterHit);
    if(energyAfterHit <= 0) {
       int lifesAfterHit = lives - 1;
       print("Lifes after hit : "+lifesAfterHit);
       if(lifesAfterHit == 0) {
         ship.remove();
         gameOver();
       } else {
         lives -= 1;
         energy = 100;
         return true;
       }
    } else {
      energy -= weapon.getDamage();
    }
    return false;
  }

  void scoreHit(AlienShip alienShip) {
    this.score += alienShip.getPointsWorth();
  }

  bool isDead() {
    return lives <= 0 ? true : false;
  }

  void gameOver() {
    GameScreen screen = gameContext.getScreen();
    screen.removeChildren();
    int centerX = (screen.width / 2) - 150;
    int centerY = screen.height / 2;
    screen.addChild(new Explosion(gameContext, 100, 50));
    screen.addChild(new Explosion(gameContext, 700, 50));
    screen.addChild(new Explosion(gameContext, 100, 450));
    screen.addChild(new Explosion(gameContext, 700, 450));
    screen.addChild(new TextObject(gameContext, 'Game Over', '#CD2626', 'bold 48px sans-serif', centerX, centerY));

  }
}
