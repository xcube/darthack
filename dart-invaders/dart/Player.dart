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

  void takeHitFrom(Weapon weapon) {
    int energyAfterHit = energy - weapon.getDamage();
    if(energyAfterHit <= 0) {
       int lifesAfterHit = lives - 1;
       if(lifesAfterHit == 0) {
         // TODO: game over
       } else {
         lives -= 1;
         energy = 100;
       }
    } else {
      energy -= weapon.getDamage();
    }
  }
}
