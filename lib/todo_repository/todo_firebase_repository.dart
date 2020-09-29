import 'package:bloc_login/task.dart';
import 'package:bloc_login/todo.dart';
import 'file:///F:/Flutter/bloc_login/lib/todo_repository/todo_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseRepository extends TodoRepository{
  final todoCellection = FirebaseFirestore.instance.collection('todos');

  @override
  Future<void> addTask(Todo todo) {
    todoCellection.add(todo.toTask().toDocument());
  }

  @override
  Future<void> deleteTask(Todo todo) {
    todoCellection.doc(todo.id).delete();
  }

  @override
  Stream<List<Todo>> todos() {
    return todoCellection.snapshots().map((snapshot) {
      return snapshot.docs.map((e) => Todo.fromTask(Task.fromSnapshot(e))).toList();
    });
  }

  @override
  Future<void> updateTask(Todo todo) {
    return todoCellection.doc(todo.id).update(todo.toTask().toDocument());
  }

}