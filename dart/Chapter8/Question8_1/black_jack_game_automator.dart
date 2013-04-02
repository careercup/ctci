part of main;

class BlackJackGameAutomator {
  Deck<BlackJackCard> _deck;
  List<BlackJackHand> _hands;
  static final int HIT_UNTIL = 16;

  BlackJackGameAutomator(int numPlayers) {
    _hands = new List<BlackJackHand>(numPlayers);
    for (int i = 0; i < numPlayers; i++) {
      _hands[i] = new BlackJackHand();
    }
  }

  bool dealInitial() {
    for (BlackJackHand hand in _hands) {
      BlackJackCard card2 = _deck.dealCard();
      BlackJackCard card1 = _deck.dealCard();
      if (card1 == null || card2 == null) {
        return false;
      }

      hand.addCard(card1);
      hand.addCard(card2);
    }

    return true;
  }

  List<int> getBlackJacks() {
    List<int> winners = new List<int>();
    for (int i = 0; i < _hands.length; i++) {
      if (_hands[i].isBlackJack()) {
        winners.add(i);
      }
    }

    return winners;
  }

  bool playHandAsInt(int i) {
    BlackJackHand hand = _hands[i];
    return playHand(hand);
  }

  bool playHand(BlackJackHand hand) {
    while (hand.score() < HIT_UNTIL) {
      BlackJackCard card = _deck.dealCard();
      if (card == null) {
        return false;
      }

      hand.addCard(card);
    }

    return true;
  }

  bool playAllHands() {
    for (BlackJackHand hand in _hands) {
      if (!playHand(hand)) {
        return false;
      }
    }

    return true;
  }

  List<int> getWinners() {
    List<int> winners = new List<int>();
    int winningScore = 0;
    for (int i = 0; i < _hands.length; i++) {
      BlackJackHand hand = _hands[i];
      if (!hand.busted()) {
        if (hand.score() > winningScore) {
          winningScore = hand.score();
          winners.clear();
          winners.add(i);
        } else if (hand.score() == winningScore) {
          winners.add(i);
        }
      }
    }

    return winners;
  }

  void initializeDeck() {
    List<BlackJackCard> cards = new List<BlackJackCard>();
    for (int i = 1; i < 13; i++) {
      for (int j = 0; j <= 3; j++) {
        Suit suit = Suit.getSuitFromValue(j);
        BlackJackCard card = new BlackJackCard(i, suit);
        cards.add(card);
      }
    }

    _deck = new Deck<BlackJackCard>();
    _deck.setDeckOfCards(cards);
    _deck.shuffle();
  }

  void printHandsAndScore() {
    for (int i = 0; i < _hands.length; i++) {
      print("Hand $i (${_hands[i].score()}): ${_hands[i].print_cards()}");
    }
  }

}
