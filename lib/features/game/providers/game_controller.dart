import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../logic/tic_tac_toe_logic.dart';

import '../logic/ai_logic.dart';

part 'game_controller.g.dart';

class GameState {
  final List<Player> board;
  final Player currentPlayer;
  final Player? winner;
  final bool isDraw;
  final int moves;
  final String aiDifficulty;

  GameState({
    required this.board,
    this.currentPlayer = Player.x,
    this.winner,
    this.isDraw = false,
    this.moves = 0,
    this.aiDifficulty = 'normal',
  });

  GameState copyWith({
    List<Player>? board,
    Player? currentPlayer,
    Player? winner,
    bool? isDraw,
    int? moves,
    String? aiDifficulty,
  }) {
    return GameState(
      board: board ?? this.board,
      currentPlayer: currentPlayer ?? this.currentPlayer,
      winner: winner ?? this.winner,
      isDraw: isDraw ?? this.isDraw,
      moves: moves ?? this.moves,
      aiDifficulty: aiDifficulty ?? this.aiDifficulty,
    );
  }
}

@riverpod
class GameController extends _$GameController {
  @override
  GameState build() {
    return GameState(board: List.filled(9, Player.none));
  }

  void setDifficulty(String difficulty) {
    state = state.copyWith(aiDifficulty: difficulty);
  }

  Future<void> makeMove(int index) async {
    if (state.board[index] != Player.none || state.winner != null || state.isDraw) {
      return;
    }

    _applyMove(index);

    // If game not over and AI's turn (O), make AI move
    if (state.winner == null && !state.isDraw && state.currentPlayer == Player.o) {
      await Future.delayed(const Duration(milliseconds: 500));
      final aiMove = AILogic.getBestMove(state.board, Player.o, state.aiDifficulty);
      if (aiMove != -1) {
        _applyMove(aiMove);
      }
    }
  }

  void _applyMove(int index) {
    final newBoard = List<Player>.from(state.board);
    newBoard[index] = state.currentPlayer;
    final newMoves = state.moves + 1;

    if (TicTacToeLogic.checkWin(newBoard, state.currentPlayer)) {
      state = state.copyWith(
        board: newBoard,
        winner: state.currentPlayer,
        moves: newMoves,
      );
    } else if (TicTacToeLogic.isDraw(newBoard)) {
      state = state.copyWith(
        board: newBoard,
        isDraw: true,
        moves: newMoves,
      );
    } else {
      state = state.copyWith(
        board: newBoard,
        currentPlayer: state.currentPlayer == Player.x ? Player.o : Player.x,
        moves: newMoves,
      );
    }
  }

  void reset() {
    state = GameState(
      board: List.filled(9, Player.none),
      aiDifficulty: state.aiDifficulty,
    );
  }
}
