import 'package:bloc_login/todo.dart';

abstract class TodoRepository {
  Future <void> addTask( Todo todo );
  Future <void> deleteTask ( Todo todo );
  Stream <List<Todo>> todos();
  Future <void> updateTask( Todo todo );
}