import 'package:bloc_login/filter_button.dart';
import 'package:bloc_login/todo.dart';
import 'package:equatable/equatable.dart';

abstract class FilterEvent extends Equatable{
  FilterEvent();
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class UpdateFilter extends FilterEvent{
  Filter filter;
  UpdateFilter(this.filter);
  @override
  List<Object> get props => [filter];
}

class UpdateTodos extends FilterEvent{
   List<Todo> todos;
  UpdateTodos(this.todos);
  @override
  List<Object> get props => [todos];
}