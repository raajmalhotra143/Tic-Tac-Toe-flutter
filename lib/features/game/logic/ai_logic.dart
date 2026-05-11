import 'dart:math';
import 'tic_tac_toe_logic.dart';

class AILogic {
  static int getBestMove(List<Player> board, Player aiPlayer, String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'easy':
        return _getRandomMove(board);
      case 'normal':
        return _getHeuristicMove(board, aiPlayer);
      case 'impossible':
        return _getMinimaxMove(board, aiPlayer);
      default:
        return _getRandomMove(board);
    }
  }

  static int _getRandomMove(List<Player> board) {
    final availableMoves = <int>[];
    for (int i = 0; i < board.length; i++) {
      if (board[i] == Player.none) availableMoves.add(i);
    }
    if (availableMoves.isEmpty) return -1;
    return availableMoves[Random().nextInt(availableMoves.length)];
  }

  static int _getHeuristicMove(List<Player> board, Player aiPlayer) {
    final opponent = aiPlayer == Player.x ? Player.o : Player.x;

    // 1. Can AI win?
    for (int i = 0; i < 9; i++) {
      if (board[i] == Player.none) {
        final nextBoard = List<Player>.from(board)..[i] = aiPlayer;
        if (TicTacToeLogic.checkWin(nextBoard, aiPlayer)) return i;
      }
    }

    // 2. Can AI block opponent?
    for (int i = 0; i < 9; i++) {
      if (board[i] == Player.none) {
        final nextBoard = List<Player>.from(board)..[i] = opponent;
        if (TicTacToeLogic.checkWin(nextBoard, opponent)) return i;
      }
    }

    // 3. Center
    if (board[4] == Player.none) return 4;

    // 4. Corners
    final corners = [0, 2, 6, 8];
    final availableCorners = corners.where((c) => board[c] == Player.none).toList();
    if (availableCorners.isNotEmpty) {
      return availableCorners[Random().nextInt(availableCorners.length)];
    }

    // 5. Random
    return _getRandomMove(board);
  }

  static int _getMinimaxMove(List<Player> board, Player aiPlayer) {
    int bestScore = -1000;
    int move = -1;

    for (int i = 0; i < 9; i++) {
      if (board[i] == Player.none) {
        board[i] = aiPlayer;
        int score = _minimax(board, 0, false, aiPlayer, -1000, 1000);
        board[i] = Player.none;
        if (score > bestScore) {
          bestScore = score;
          move = i;
        }
      }
    }
    return move;
  }

  static int _minimax(List<Player> board, int depth, bool isMaximizing, Player aiPlayer, int alpha, int beta) {
    final opponent = aiPlayer == Player.x ? Player.o : Player.x;

    if (TicTacToeLogic.checkWin(board, aiPlayer)) return 10 - depth;
    if (TicTacToeLogic.checkWin(board, opponent)) return depth - 10;
    if (TicTacToeLogic.isDraw(board)) return 0;

    if (isMaximizing) {
      int bestScore = -1000;
      for (int i = 0; i < 9; i++) {
        if (board[i] == Player.none) {
          board[i] = aiPlayer;
          int score = _minimax(board, depth + 1, false, aiPlayer, alpha, beta);
          board[i] = Player.none;
          bestScore = max(score, bestScore);
          alpha = max(alpha, score);
          if (beta <= alpha) break;
        }
      }
      return bestScore;
    } else {
      int bestScore = 1000;
      for (int i = 0; i < 9; i++) {
        if (board[i] == Player.none) {
          board[i] = opponent;
          int score = _minimax(board, depth + 1, true, aiPlayer, alpha, beta);
          board[i] = Player.none;
          bestScore = min(score, bestScore);
          beta = min(beta, score);
          if (beta <= alpha) break;
        }
      }
      return bestScore;
    }
  }
}
