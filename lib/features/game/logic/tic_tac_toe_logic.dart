enum Player { x, o, none }

class TicTacToeLogic {
  static const int boardSize = 3;

  static bool checkWin(List<Player> board, Player player) {
    // Rows
    for (int i = 0; i < 9; i += 3) {
      if (board[i] == player && board[i + 1] == player && board[i + 2] == player) return true;
    }
    // Columns
    for (int i = 0; i < 3; i++) {
      if (board[i] == player && board[i + 3] == player && board[i + 6] == player) return true;
    }
    // Diagonals
    if (board[0] == player && board[4] == player && board[8] == player) return true;
    if (board[2] == player && board[4] == player && board[6] == player) return true;

    return false;
  }

  static bool isDraw(List<Player> board) {
    return !board.contains(Player.none);
  }

  static int calculateStars(int moves) {
    // Stars(m) = max(0, 3 - floor((m-3)/1))
    // But Tic-Tac-Toe moves for a single player are different.
    // Let's assume 'm' is total moves in the game.
    // For X to win in 3 moves (its own), total moves = 5 (X O X O X)
    // Wait, the formula says m is total moves.
    final stars = 3 - (moves - 3);
    if (stars < 0) return 0;
    if (stars > 3) return 3;
    return stars;
  }
}
