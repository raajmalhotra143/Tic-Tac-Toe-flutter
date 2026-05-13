enum Player { x, o, none }

class TicTacToeLogic {
  static const int boardSize = 3;

  static bool checkWin(List<Player> board, Player player) {
    return getWinningLine(board, player) != null;
  }

  static List<int>? getWinningLine(List<Player> board, Player player) {
    // Rows
    for (int i = 0; i < 9; i += 3) {
      if (board[i] == player && board[i + 1] == player && board[i + 2] == player) return [i, i + 1, i + 2];
    }
    // Columns
    for (int i = 0; i < 3; i++) {
      if (board[i] == player && board[i + 3] == player && board[i + 6] == player) return [i, i + 3, i + 6];
    }
    // Diagonals
    if (board[0] == player && board[4] == player && board[8] == player) return [0, 4, 8];
    if (board[2] == player && board[4] == player && board[6] == player) return [2, 4, 6];

    return null;
  }

  static bool isDraw(List<Player> board) {
    return !board.contains(Player.none);
  }

  static int calculateStars(int moves) {
    final stars = 3 - (moves - 3);
    if (stars < 0) return 0;
    if (stars > 3) return 3;
    return stars;
  }
}
