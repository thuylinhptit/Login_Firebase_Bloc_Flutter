
import 'package:bloc_login/todo.dart';
import 'package:equatable/equatable.dart';

abstract class TodoState extends Equatable{
  @override
  List<Object> get props => [];
}

class TodoLoading extends TodoState{

}

class TodoLoaded extends TodoState{
  final List<Todo> todos;
  TodoLoaded([this.todos = const[]]);
  @override
  List<Object> get props => [todos];


}

class TodoNotLoaded extends TodoState{

}

