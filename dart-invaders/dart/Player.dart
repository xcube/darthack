class Player {

  int score;
  int lives;
  int energy;
  int perLifeEnergy;
  int lowEnergyPercentage;
  List<Weapon> weapons;
  PlayerShip ship;
  GameContext gameContext;

  Player(int this.lives, int this.energy) {
    this.score = 0;
    this.perLifeEnergy = energy;
    this.lowEnergyPercentage = 0.25;
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
         gameOver('Game Over');
       } else {
         lives -= 1;
         energy = perLifeEnergy;
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

  bool hasLowEnergy() {
    int lowEnergyPct = (perLifeEnergy / 100) * lowEnergyPercentage;
    return (energy / 100) < lowEnergyPct;
  }

  void gameOver(String text) {
    GameScreen screen = gameContext.getScreen();
    screen.removeChildren();
    int centerX = (screen.width / 2) - 150;
    int centerY = screen.height / 2;
    screen.addChild(new Explosion(gameContext, 100, 50));
    screen.addChild(new Explosion(gameContext, 700, 50));
    screen.addChild(new Explosion(gameContext, 100, 450));
    screen.addChild(new Explosion(gameContext, 700, 450));
    screen.addChild(new TextObject(gameContext, text, '#CD2626', 'bold 48px sans-serif', centerX, centerY));

  }
}
