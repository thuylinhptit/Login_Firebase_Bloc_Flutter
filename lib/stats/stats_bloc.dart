import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_login/stats/stats_event.dart';
import 'package:bloc_login/stats/stats_state.dart';
import 'package:bloc_login/todo/todo_bloc.dart';
import 'package:bloc_login/todo/todo_state.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  StreamSubscription _todosSubscription;

  StatsBloc({TodoBloc todosBloc})
      : assert(todosBloc != null),
        super(StatsLoading()) {
    _todosSubscription = todosBloc.listen(( state) {
      if (state is TodoLoaded) {
        add(UpdateStats((state as TodoLoaded).todos));
      }
    });
  }

  @override
  Stream<StatsState> mapEventToState(StatsEvent event) async* {
    if (event is UpdateStats) {
      int numActive =
          event.todos.where((todo) => !todo.isComplete).toList().length;
      int numCompleted =
          event.todos.where((todo) => todo.isComplete).toList().length;
      yield StatsLoaded(numActive, numCompleted);
    }
  }

  @override
  Future<void> close() {
    _todosSubscription?.cancel();
    return super.close();
  }
}
