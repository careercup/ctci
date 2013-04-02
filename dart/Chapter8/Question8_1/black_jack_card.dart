part of main;

class BlackJackCard extends Card {
  BlackJackCard(int c, Suit s) : super(c, s);

  int value() {
    if (isAce()) { // Ace
      return 1;
    } else if (faceValue >= 11 && faceValue <= 13) { // Face card
      return 10;
    } else { // Number card
      return faceValue;
    }
  }

  int minValue() {
    if (isAce()) { // Ace
      return 1;
    } else {
      return value();
    }
  }

  int maxValue()  {
    if (isAce()) { // Ace
      return 11;
    } else {
      return value();
    }
  }

  bool isAce() {
    return faceValue == 1;
  }

  bool isFaceCard() {
    return faceValue >= 11 && faceValue <= 13;
  }
}
