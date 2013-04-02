import 'dart:math';

Random random = new Random();

void shuffleArray(List<int> cards) {
  int temp;
  int index;
  for (int i = 0; i < cards.length; i++) {
    index = (random.nextDouble() * (cards.length - i)).toInt() + i;
    temp = cards[i];
    cards[i] = cards[index];
    cards[index] = temp;
  }
}

void main() {
  List<int> cards = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  print(cards);
  shuffleArray(cards);
  print(cards);
}