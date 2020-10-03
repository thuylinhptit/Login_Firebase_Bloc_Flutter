import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_login/filter/filter_state.dart';
import 'package:bloc_login/filter_button.dart';
import 'package:bloc_login/todo.dart';
import 'package:bloc_login/todo/todo_bloc.dart';
import 'package:bloc_login/todo/todo_state.dart';


import 'filter_event.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState>{
  final TodoBloc _todoBloc;
  StreamSubscription subscription;
  FilterBloc( TodoBloc todoBloc) : assert( todoBloc != null ),
  _todoBloc = todoBloc, super(todoBloc.state is TodoLoaded
          ? FilterLoaded(
        (todoBloc.state as TodoLoaded).todos,
        Filter.all,
      )
          : FilterLoading()){
    subscription = todoBloc.listen((stats) {
      if( stats is TodoLoaded ){
        add(UpdateTodos((todoBloc.state as TodoLoaded).todos));
      }
    });
  }

  @override
  Stream<FilterState> mapEventToState(FilterEvent event) async* {
    if( event is UpdateFilter ){
      yield* _mapUpdateFilterTodState(event);
    }
    else if( event is UpdateTodos){
      yield* _mapUpdateTodosToState(event);
    }

  }

  Stream<FilterState>_mapUpdateFilterTodState(UpdateFilter event) async* {
    final currentState = _todoBloc.state;
    if( currentState is TodoLoaded ){
      yield FilterLoaded(
        _mapTodosToFilterTodo(currentState.todos, event.filter), event.filter,
      );
    }

  }

  Stream<FilterState> _mapUpdateTodosToState(UpdateTodos event ) async*{
    final filter = state is FilterLoaded ? ( state as FilterLoaded).activeFilter : Filter.all;
    yield FilterLoaded( _mapTodosToFilterTodo(
        (_todoBloc.state as TodoLoaded).todos, filter,), filter,);
  }

  List<Todo> _mapTodosToFilterTodo(List<Todo> todos, Filter filter){
    return todos.where((element) {
      if( element == Filter.all ){
        return true;
      }
      // ignore: unrelated_type_equality_checks
      else if( element == Filter.incompleted ){
        return !element.isComplete;
      }
      return element.isComplete;
    }).toList();
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }

}