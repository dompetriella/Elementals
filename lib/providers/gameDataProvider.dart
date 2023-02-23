import 'package:elementals/models/enums.dart';
import 'package:elementals/models/player_data.dart';
import 'package:elementals/providers/playerDataProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../game_logic/logic.dart';
import '../models/element_card_data.dart';
import '../models/game_data.dart';

final cardsInHandProvider = Provider<int>((ref) {
  return 5;
});

final gameDataProvider = StateNotifierProvider<GameNotifier, GameData>((ref) {
  return GameNotifier();
});

class GameNotifier extends StateNotifier<GameData> {
  GameNotifier() : super(GameData(players: [PlayerData(), PlayerData()]));

  discardPlayZone(WidgetRef ref) {
    List<ElementCardData> playedCardsCopy = state.playZone.toList();
    ElementCardData lastCardPlayed = playedCardsCopy.last;
    playedCardsCopy.removeLast();
    state = state.copyWith(playZone: playedCardsCopy);
    PlayerData playerOne = state.players[0];
    PlayerData playerTwo = state.players[1];

    for (var card in playedCardsCopy) {
      if (card.ownerId == playerOne.id) {
        playerOne =
            playerOne.copyWith(discardPile: [...playerOne.discardPile, card]);
      } else if (card.ownerId == playerTwo.id) {
        playerTwo =
            playerTwo.copyWith(discardPile: [...playerTwo.discardPile, card]);
      }
    }

    ref.read(playerProvider.notifier).state = playerOne;
    ref.read(playerTwoProvider.notifier).state = playerTwo;

    state = state.copyWith(playZone: [lastCardPlayed]);

    state = state.copyWith(players: [playerOne, playerTwo]);
  }

  switchActivePlayer(WidgetRef ref) {
    if (state.players[0].id == state.currentPlayer.id) {
      state = state.copyWith(currentPlayer: state.players[1]);
    } else {
      state = state.copyWith(currentPlayer: state.players[0]);
    }
  }

  resetPlayZone() {
    state = state.copyWith(
        playZone: [],
        currentWinner: PlayerData(),
        overallScore: 0,
        gameOver: false,
        totalTurns: 1,
        playerTurns: 1);
  }

  increaseTurnCount() {
    if (state.totalTurns % 2 == 0) {
      state = state.copyWith(
          totalTurns: state.totalTurns + 1, playerTurns: state.playerTurns + 1);
    } else {
      state = state.copyWith(totalTurns: state.totalTurns + 1);
    }
  }
}
