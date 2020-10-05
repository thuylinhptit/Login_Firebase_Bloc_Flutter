
import 'package:bloc_login/todo/todo_bloc.dart';
import 'package:bloc_login/todo/todo_event.dart';
import 'package:bloc_login/todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Filter {all, incompleted, completed}
class FilterButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if( state is TodoLoaded){
            return PopupMenuButton<TodoFilter>(
              icon: Icon(Icons.menu),
              onSelected: (action){
                switch(action){
                  case TodoFilter.all:
                    BlocProvider.of<TodoBloc>(context).add(UpdateFilter(action));
                    break;
                  case TodoFilter.incompleted:
                    BlocProvider.of<TodoBloc>(context).add(UpdateFilter(action));
                    break;
                  case TodoFilter.completed:
                    BlocProvider.of<TodoBloc>(context).add(UpdateFilter(action));
                    break;
                }

              },
                itemBuilder: (BuildContext context ) => <PopupMenuItem<TodoFilter>> [
                  PopupMenuItem(
                    value: TodoFilter.all,
                    child: Text(
                        " All Todo"
                    ),
                  ),
                  PopupMenuItem(
                    value: TodoFilter.incompleted,
                    child: Text(
                        "Incompleted Todo"
                    ),
                  ),
                  PopupMenuItem(
                    value: TodoFilter.completed,
                    child: Text(
                        "Completed Todo"
                    ),
                  )
                ],
            );
          }
          return Container();
        });
  }
}
