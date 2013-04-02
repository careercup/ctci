
library main;

import '../../utils/assorted_methods.dart';

part 'suit.dart';
part 'card.dart';
part 'hand.dart';
part 'deck.dart';

part 'black_jack_card.dart';
part 'black_jack_hand.dart';
part 'black_jack_game_automator.dart';

void main() {

  int numHands = 5;

  BlackJackGameAutomator automator = new BlackJackGameAutomator(numHands);
  automator.initializeDeck();
  bool success = automator.dealInitial();
  if (!success) {
    print("Error. Out of cards.");
  } else {
    print("-- Initial --");
    automator.printHandsAndScore();
    List<int> blackjacks = automator.getBlackJacks();
    if (blackjacks.length > 0) {
      print("Blackjack at ");
      for (int i in blackjacks) {
        print("$i, ");
      }
      print("");
    } else {
      success = automator.playAllHands();
      if (!success) {
        print("Error. Out of cards.");
      } else {
        print("\n-- Completed Game --");
        automator.printHandsAndScore();
        List<int> winners = automator.getWinners();
        if (winners.length > 0) {
          print("Winners: ");
          for (int i in winners) {
            print("$i, ");
          }
          print("");
        } else {
          print("Draw. All players have busted.");
        }
      }
    }
  }

}