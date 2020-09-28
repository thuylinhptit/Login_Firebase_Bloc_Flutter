import 'package:bloc_login/task.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


class Todo extends Equatable{
  final bool isComplete;
  final String id;
  final String title;

  Todo( {this.isComplete = false, String title = '', String id,})
      : this.title = title ?? '',
        this.id = id;

  Todo copyWith({bool isComplete, String id, String title, String content}) {
    return Todo(
      isComplete: isComplete ?? this.isComplete,
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

@override
  List<Object> get props => [isComplete, id, title];

  @override
  String toString() {
    return 'Todo { complete: $isComplete, note: $title, id: $id }';
  }
  Task toTask() {
    return Task();
  }

  static Todo fromTask(Task task) {
    return Todo(
      isComplete: task.isComplete ?? false,
      title: task.title,
      id: task.id,
    );
  }
}