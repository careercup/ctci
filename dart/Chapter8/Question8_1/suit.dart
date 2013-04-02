part of main;

class Suit {
  static const Club = 0;
  static const Diamond = 1;
  static const Heart = 2;
  static const Spade = 3;

  int _value;
  Suit(this._value);

  int get value => _value;

  static Suit getSuitFromValue(int value) {
    switch(value) {
      case 0:
        return new Suit(Suit.Club);
      case 1:
        return new Suit(Suit.Diamond);
      case 2:
        return new Suit(Suit.Heart);
      case 3:
        return new Suit(Suit.Spade);
      default:
        return null;
    }
  }
}