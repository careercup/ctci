part of main;

class Hand <T extends Card> {

  List<T> cards = new List<T>();

  int score() {
    int score = 0;
    for (T card in cards) {
      score += card.value();
    }
    return score;
  }

  void addCard(T card) {
    cards.add(card);
  }

  void print_cards() {
    for (Card card in cards) {
      card.print_card();
    }
  }
}