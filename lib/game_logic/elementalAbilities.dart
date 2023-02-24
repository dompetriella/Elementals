import 'package:elementals/game_logic/logic.dart';
import 'package:elementals/models/enums.dart';
import 'package:elementals/providers/playerDataProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/player_data.dart';

// enum ElementalAbility {
//   // first tier
//   burn,
//   gust,
//   cleanse,
//   forge,
//   // second tier
//   glow,
//   gale,
//   tide,
//   crumble
// }

enum Ability {
  // tier one
  burn('Select a card from the hand.  That card is permanently removed',
      ElementalType.fire),
  gust(
      'Select a card from the hand.  That card, and all cards to the left, are exchanged with random cards from the deck',
      ElementalType.air),
  float(
      'Select a card from the hand.  Discard this card and next turn it will be on the top of discard pile',
      ElementalType.water),
  forge(
      "Select a card from the hand.  That card's value is permanently increased by one",
      ElementalType.earth),
  // tier two
  glow(
      "Select a card from the hand.  That card is permanently worth +1 points and Effect Chances are doubled. This effect stacks",
      ElementalType.fire),
  gale(
      "Select a card from the hand.  That card is gains points equal to the number of cards left in the hand",
      ElementalType.air),
  tide(
      "Select a card from the hand.  That card is exchanged with the card on top of the discard pile",
      ElementalType.water),
  crumble(
      "Select a card from the hand.  That card's value is permanently decreased by one",
      ElementalType.earth);

  final String description;
  final ElementalType elementalType;
  const Ability(
    this.description,
    this.elementalType,
  );
}

runAbility(Ability ability, PlayerDataNotifier notifier, String cardId,
    WidgetRef ref, Players playerNumber) {
  switch (ability) {
    case Ability.burn:
      notifier.fireAbilityOne(ref, cardId, playerNumber);
      break;
    case Ability.gust:
      notifier.airAbilityOne(ref, cardId, playerNumber);
      break;
    case Ability.float:
      notifyDynamicInfo(
          ref, '${ability.name} is not ready yet, doing nothing.');
      break;
    case Ability.forge:
      notifier.fireAbilityOne(ref, cardId, playerNumber);
      break;

    case Ability.glow:
      notifyDynamicInfo(
          ref, '${ability.name} is not ready yet, doing nothing.');
      break;
    case Ability.gale:
      notifyDynamicInfo(
          ref, '${ability.name} is not ready yet, doing nothing.');
      break;
    case Ability.tide:
      notifier.waterAbilityTwo(ref, cardId, playerNumber);
      break;
    case Ability.crumble:
      notifier.earthAbilityTwo(ref, cardId, playerNumber);
      break;
    default:
  }
}
