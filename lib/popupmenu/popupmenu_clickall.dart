
import 'package:bloc_login/todo/todo_bloc.dart';
import 'package:bloc_login/todo/todo_event.dart';
import 'package:bloc_login/todo/todo_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum PopupClickAll {allCompleted, allDelete}
class PopupMenuClickAll extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state){
        if( state is TodoLoaded ){

          return PopupMenuButton<PopupClickAll>(
            icon: Icon(Icons.more_vert),
            onSelected: (action){
              switch(action){
                case PopupClickAll.allCompleted:
                  BlocProvider.of<TodoBloc>(context).add(DoneAll());
                  break;
              }
              switch(action){
                case PopupClickAll.allDelete:
                  BlocProvider.of<TodoBloc>(context).add(DeleteAll());
                  break;
              }
            },
            itemBuilder: (BuildContext context ) => <PopupMenuItem<PopupClickAll>> [
              PopupMenuItem(
                value: PopupClickAll.allCompleted,
                child: Text(
                 "Done All"
                ),
              ),
              PopupMenuItem(
                value: PopupClickAll.allDelete,
                child: Text(
                  "Delete all"
                ),
              )
            ],
          );
        }
        return Container();
      },
    );
  }

}