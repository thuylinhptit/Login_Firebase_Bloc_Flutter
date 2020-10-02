
import 'package:bloc_login/todo.dart';
import 'package:bloc_login/todo_repository/todo_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseRepository extends TodoRepository {
  final todoCollection = FirebaseFirestore.instance.collection('todos');

  @override
  Future<void> addTask(Todo todo) {
    return todoCollection.add(todo.toDocument());
  }

  @override
  Future<void> deleteTask(Todo todo) {
    return todoCollection.doc(todo.id).delete();
  }

  @override
  Stream<List<Todo>> todos() {
    return todoCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((e) => Todo(
              id: e.id,
              isComplete: e.data()["isComplete"] ?? false,
              title: e.data()["title"]))
          .toList();
    });
  }

  @override
  Future<void> updateTask(Todo todo) {
    return todoCollection.doc(todo.id).update(todo.toDocument());
  }
}
