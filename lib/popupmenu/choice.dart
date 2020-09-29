
enum TodoStatus{ allTodo, completed, notCompleted}
TodoStatus status = TodoStatus.allTodo;
class Choice{
  const Choice({this.title, this.index});
  final String title;
  final int index;
}
const List<Choice> choice = const<Choice>[
  const Choice( title: "All Todo", index: 1),
  const Choice( title: "Completed", index: 2),
  const Choice( title: "Not Completed", index: 3)
];

void choiceStatus ( Choice choice ){
  if( choice.index == 1 ) {
    status = TodoStatus.allTodo;
  }
  else if( choice.index == 2 ){
    status = TodoStatus.completed;
  }
  else if( choice.index == 3 ){
    status = TodoStatus.notCompleted;
  }
}
