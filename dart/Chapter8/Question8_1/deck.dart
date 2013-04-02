part of main;

class Deck <T extends Card> {
  List<T> _cards;
  int dealtIndex = 0; // marks first undealt card


  void setDeckOfCards(List<T> deckOfCards) {
    _cards = deckOfCards;
  }

  void shuffle() {
    for (int i = 0; i < _cards.length; i++) {
      int j = randomIntInRange(i, _cards.length);
      T card1 = _cards[i];
      T card2 = _cards[j];
      _cards[i] = card2;
      _cards[j] = card1;
    }
  }

  int remainingCards() {
    return _cards.length - dealtIndex;
  }

  List<T> dealHand(int number) {
    if (remainingCards() < number) {
      return null;
    }

    List<T> hand = new List<Card>(number);
    int count = 0;
    while(count < number) {
      T card = dealCard();
      if (card != null) {
        hand[count] = card;
        count++;
      }
    }

    return hand;
  }

  T dealCard() {
    if (remainingCards() == 0) {
      return null;
    }

    T card = _cards[dealtIndex];
    card.markUnavailable();
    dealtIndex++;

    return card;
  }


  void print_deck() {
    for (Card card in _cards) {
      card.print_card();
    }
  }

}
