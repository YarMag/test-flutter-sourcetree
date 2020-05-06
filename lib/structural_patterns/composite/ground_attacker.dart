import 'package:start_app/structural_patterns/composite/battle_unit_interface.dart';

class GroundAttacker implements IBattleUnit {
  void attack() {
    print("Attack from the ground");
  }

  void move() {
    print("Move to the next area");
  }

  void stop() {
    print("Stop on the ground");
  }
}

class AirAttacker implements IBattleUnit {
  void attack() {
    print("Attack from the air");
  }

  void move() {
    print("Fly to the next area");
  }

  void stop() {
    print("Stop in the air");
  }
}

class UnitsGroup implements IBattleUnit {
  List<IBattleUnit> _units;

  UnitsGroup(this._units);

  void attack() {
    _units.forEach((u) => u.attack());
  }

  void move() {
    _units.forEach((u) => u.move());
  }

  void stop() {
    _units.forEach((u) => u.stop());
  }
}
