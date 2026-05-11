# AI Algorithms: Perfect Play & Minimax

**Domain:** Game AI / Deterministic Games
**Researched:** 2025-05-24

## Core Algorithm: Minimax

Tic-Tac-Toe is a "zero-sum" game of "perfect information." The **Minimax** algorithm is the optimal strategy.

### 1. The "Impossible" Mode (Perfect Play)
To ensure the human player can *never* win, the AI must search to the terminal nodes of the game tree (max depth 9).

**Heuristic Scoring:**
- **Win:** +10
- **Loss:** -10
- **Draw:** 0

**Optimization (Depth-Adjustment):**
To make the AI play "competitively" (e.g., winning in 3 moves instead of 5), the depth is subtracted from the win score.
- `Score = 10 - depth`
- This ensures the AI chooses the *shortest* path to victory and the *longest* path to defeat.

### 2. Difficulty Levels

| Level | Search Depth | Heuristic / Behavior |
|-------|--------------|----------------------|
| **Easy** | 0-1 | Chooses moves almost randomly. Only blocks if the win is immediate. |
| **Medium** | 2-4 | Can see basic "forks" and sets up two-in-a-row. Can be trapped by advanced players. |
| **Hard** | 6 | Almost perfect. Will block most traps but might miss extremely obscure end-game scenarios. |
| **Impossible**| 9 | **Perfect Play.** Mathematically impossible to beat. Best result is a Draw. |

### 3. Alpha-Beta Pruning
While not strictly necessary for a 3x3 board (255,168 states), Alpha-Beta pruning should be implemented to allow for larger boards (e.g., 5x5 or 10x10) in future updates. It reduces the number of nodes evaluated by the minimax algorithm by "pruning" branches that cannot possibly influence the final decision.

## Implementation Snippet (Dart)

```dart
int minimax(Board board, int depth, bool isMaxing) {
  int score = evaluate(board);

  if (score == 10) return score - depth;
  if (score == -10) return score + depth;
  if (board.isFull()) return 0;

  if (isMaxing) {
    int best = -1000;
    for (var move in board.getAvailableMoves()) {
      board.makeMove(move, AI_PLAYER);
      best = max(best, minimax(board, depth + 1, !isMaxing));
      board.undoMove(move);
    }
    return best;
  } else {
    int best = 1000;
    for (var move in board.getAvailableMoves()) {
      board.makeMove(move, HUMAN_PLAYER);
      best = min(best, minimax(board, depth + 1, !isMaxing));
      board.undoMove(move);
    }
    return best;
  }
}
```

## AI Aesthetics: "Thinking" Heuristic
- **Variable Delay:** Instead of a static `Future.delayed`, use a range `(500ms + (depth * 100ms))` to simulate the AI "calculating" more complex positions.
- **Visual Feedback:** Pulse the AI's "glow" or change the background neon intensity while it's "thinking."

## Sources
- GeeksforGeeks: "Minimax Algorithm in Game Theory".
- YouTube: "Coding Challenge #154: Tic Tac Toe AI with Minimax".
