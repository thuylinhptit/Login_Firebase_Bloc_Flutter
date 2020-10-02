import 'package:bloc_login/task.dart';
import 'package:equatable/equatable.dart';

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
    return 'Todo { complete: $isComplete, title: $title, id: $id }';
  }
  Task toTask() {
    return Task();
  }

  Map<String, dynamic> toDocument() => {
    "isComplete": isComplete,
    "title": title,
  };

  static Todo fromTask(Task task) {
    return Todo(
      isComplete: task.isComplete ?? false,
      title: task.title,
      id: task.id,
    );
  }
}