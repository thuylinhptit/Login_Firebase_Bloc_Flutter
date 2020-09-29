import 'package:bloc_login/item_task.dart';
import 'package:bloc_login/todo.dart';
import 'package:flutter/cupertino.dart';

class ListTodo extends StatelessWidget{
  final List <Todo> listTodo ;

  const ListTodo({Key key, this.listTodo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getTask(),
    );
  }
  List<Widget> getTask(){
    var currentIndex = -1;
    return listTodo.map((e) {
      currentIndex += 1;
      return  ItemTodo(todo: e,index: currentIndex, );
    }).toList();
  }

}