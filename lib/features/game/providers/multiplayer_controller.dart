import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../logic/tic_tac_toe_logic.dart';
import '../../../services/supabase_service.dart';

part 'multiplayer_controller.g.dart';

class MultiplayerState {
  final List<Player> board;
  final Player mySymbol;
  final Player currentPlayer;
  final Player? winner;
  final bool isDraw;
  final String? opponentName;
  final bool isMyTurn;

  MultiplayerState({
    required this.board,
    required this.mySymbol,
    this.currentPlayer = Player.x,
    this.winner,
    this.isDraw = false,
    this.opponentName,
    required this.isMyTurn,
  });

  MultiplayerState copyWith({
    List<Player>? board,
    Player? mySymbol,
    Player? currentPlayer,
    Player? winner,
    bool? isDraw,
    String? opponentName,
    bool? isMyTurn,
  }) {
    return MultiplayerState(
      board: board ?? this.board,
      mySymbol: mySymbol ?? this.mySymbol,
      currentPlayer: currentPlayer ?? this.currentPlayer,
      winner: winner ?? this.winner,
      isDraw: isDraw ?? this.isDraw,
      opponentName: opponentName ?? this.opponentName,
      isMyTurn: isMyTurn ?? this.isMyTurn,
    );
  }
}

@riverpod
class MultiplayerController extends _$MultiplayerController {
  RealtimeChannel? _channel;
  String? _gameId;

  @override
  MultiplayerState build() {
    return MultiplayerState(
      board: List.filled(9, Player.none),
      mySymbol: Player.x,
      isMyTurn: false,
    );
  }

  Future<void> joinGame(String gameId, Player symbol) async {
    _gameId = gameId;
    final supabase = await ref.read(supabaseServiceProvider.future);
    
    state = state.copyWith(mySymbol: symbol, isMyTurn: symbol == Player.x);

    _channel = supabase.client.channel('game:$_gameId')
      ..onBroadcast(event: 'move', callback: (payload) {
        final index = payload['index'] as int;
        _applyOpponentMove(index);
      })
      ..subscribe();

    ref.onDispose(() {
      _channel?.unsubscribe();
    });
  }

  void makeMove(int index) {
    if (!state.isMyTurn || state.board[index] != Player.none || state.winner != null || state.isDraw) {
      return;
    }

    _applyMyMove(index);
    _channel?.sendBroadcastMessage(
      event: 'move',
      payload: {'index': index},
    );
  }

  void _applyMyMove(int index) {
    final newBoard = List<Player>.from(state.board);
    newBoard[index] = state.mySymbol;
    
    _checkGameState(newBoard, true);
  }

  void _applyOpponentMove(int index) {
    final opponentSymbol = state.mySymbol == Player.x ? Player.o : Player.x;
    final newBoard = List<Player>.from(state.board);
    newBoard[index] = opponentSymbol;

    _checkGameState(newBoard, false);
  }

  void _checkGameState(List<Player> newBoard, bool justMoved) {
    final actingPlayer = justMoved ? state.mySymbol : (state.mySymbol == Player.x ? Player.o : Player.x);
    
    if (TicTacToeLogic.checkWin(newBoard, actingPlayer)) {
      state = state.copyWith(
        board: newBoard,
        winner: actingPlayer,
        isMyTurn: false,
      );
    } else if (TicTacToeLogic.isDraw(newBoard)) {
      state = state.copyWith(
        board: newBoard,
        isDraw: true,
        isMyTurn: false,
      );
    } else {
      state = state.copyWith(
        board: newBoard,
        isMyTurn: !justMoved,
        currentPlayer: justMoved ? (state.mySymbol == Player.x ? Player.o : Player.x) : state.mySymbol,
      );
    }
  }
}
