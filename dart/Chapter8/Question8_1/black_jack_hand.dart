part of main;

class BlackJackHand extends Hand<BlackJackCard> {
  BlackJackHand();

  int score() {
    List<int> scores = possibleScores();
    int maxUnder = -10000;
    int minOver = 10000;
    for (int score in scores) {
      if (score > 21 && score < minOver) {
        minOver = score;
      } else if (score <= 21 && score > maxUnder) {
        maxUnder = score;
      }
    }

    return maxUnder == -10000 ? minOver : maxUnder;
  }

  List<int> possibleScores() {
    List<int> scores = new List<int>();
    if (cards.length == 0) {
      return scores;
    }

    for (BlackJackCard card in cards) {
      addCardToScoreList(card, scores);
    }

    return scores;
  }

  void addCardToScoreList(BlackJackCard card, List<int> scores) {
    if (scores.length == 0) {
      scores.add(0);
    }

    int length = scores.length;
    for (int i = 0; i < length; i++) {
      int score = scores[i];
      scores[i] = score + card.minValue();
      if (card.minValue() != card.maxValue()) {
        scores.add(score + card.maxValue());
      }
    }
  }

  bool busted() {
    return score() > 21;
  }

  bool is21() {
    return score() == 21;
  }

  bool isBlackJack() {
    if (cards.length != 2) {
      return false;
    }

    BlackJackCard first = cards[0];
    BlackJackCard second = cards[1];

    return (first.isAce() && second.isFaceCard()) || (second.isAce() && first.isFaceCard());
  }
}
