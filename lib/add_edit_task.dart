import 'package:bloc_login/todo.dart';
import 'file:///F:/Flutter/bloc_login/lib/todo/todo_bloc.dart';
import 'file:///F:/Flutter/bloc_login/lib/todo/todo_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'task.dart';

class AddTask extends StatefulWidget {
  final Todo todo;
  final int index;

  AddTask({this.todo, this.index});

  @override
  _AddTask createState() => _AddTask();
}

class _AddTask extends State<AddTask> {
  final taskTextController = TextEditingController();
   TodoBloc todoBloc ;
  bool statusDone = false;

  @override
  void initState() {
    super.initState();
    todoBloc = BlocProvider.of<TodoBloc>(context);
    if (widget.todo != null) {
      taskTextController.text = widget.todo.title;
    }
  }

  @override
  void dispose() {
    todoBloc.close();
    taskTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add Task'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
                      child: TextField(
                        controller: taskTextController,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        decoration: InputDecoration(labelText: 'Add Todo'),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: RaisedButton(
                      color: Colors.lightBlueAccent,
                      child: Text('Add'),
                      onPressed: onSubmit,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> onSubmit() async {
    final String tasktext = taskTextController.text;
    final bool isComplete = statusDone;

    // Edit
    if (widget.todo != null && widget.index != null) {
      Todo todo = Todo(
          title: taskTextController.text,
          isComplete: widget.todo.isComplete,
          id: widget.todo.id);
      Navigator.pop(context);
      todoBloc.add(AddTodo(todo));
      Navigator.pop(context);
      print('Edit done');
      return;
    }
    //Add
    if (tasktext.isNotEmpty) {
      Todo todo = Todo(
        isComplete: isComplete,
        title: tasktext,
       // id: widget.todo.id
      );
      print("${tasktext.toString()}");
      todoBloc.add(AddTodo(
       todo
      ));
      Navigator.pop(context);
      print('Done Add');
    }
    else{
      print("Not");
    }
  }
}
