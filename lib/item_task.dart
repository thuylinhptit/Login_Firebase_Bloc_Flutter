
import 'package:bloc_login/Todo_state.dart';
import 'package:bloc_login/add_edit_task.dart';
import 'package:bloc_login/todo.dart';
import 'package:bloc_login/todo_bloc.dart';
import 'package:bloc_login/todo_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'task.dart';


class ItemTask extends StatelessWidget{
  final Todo todo;
  int index;
  ItemTask({@required this.todo,@required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(5, 3, 0, 0),
          child: Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: Container(
              child: ListTile(
                leading: Checkbox(
                  value: todo.isComplete,
                  onChanged: (bool checked) {
                    BlocProvider.of<TodoBloc>(context).add(UpdateTodo(
                      todo.copyWith(isComplete: !todo.isComplete)
                    ));
                  },
                ),
                title: Text(
                  todo.title, style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                ),
              ),

            ),
            actions: <Widget>[
              IconSlideAction(
                caption: 'Delete',
                color: Colors.redAccent,
                icon: Icons.delete,
                onTap: () => Delete(context, index),
              ),
              IconSlideAction(
                caption: 'Edit',
                color: Colors.blue,
                icon: Icons.edit,
                onTap: () =>
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddTask(todo: todo, index: index,),
                      fullscreenDialog: true,)),
                closeOnTap: false,
              ),
            ],
          ),
        );
      }
    );
  }

  Future<bool> Delete(BuildContext context,  int index){

    return showDialog<bool>(
        context: context,
        builder: (context){
          return AlertDialog(
            actions: [
              FlatButton(
                child: Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              FlatButton(
                  child: Text('Delete'),
                  onPressed: () {
                    BlocProvider.of<TodoBloc>(context).add(DeleteTodo(todo));
                    Navigator.pop(context, todo);
                  }
              )
            ],
          );
        }
    );
  }


}