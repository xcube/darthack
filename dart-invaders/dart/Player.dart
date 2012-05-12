class Player {

  int score;
  int lives;
  int energy;
  List<Weapon> weapons;
  PlayerShip ship;

  Player() {
    this.score = 0;
    this.lives = 3;
    this.energy = 100;
    this.weapons = new List<Weapon>();
  }

  void addWeapon(Weapon weapon) {
    this.weapons.add(weapon);
  }

  /* Return true if player lost a live, false otherwise. */
  bool takeHitFrom(Weapon weapon) {
    int energyAfterHit = energy - weapon.getDamage();
    print("Energy after hit : "+energyAfterHit);
    if(energyAfterHit <= 0) {
       int lifesAfterHit = lives - 1;
       print("Lifes after hit : "+lifesAfterHit);
       if(lifesAfterHit == 0) {
         // TODO: game over
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
}
