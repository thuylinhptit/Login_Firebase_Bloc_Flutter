import 'package:bloc_login/add_edit_task.dart';
import 'package:bloc_login/item_task.dart';
import 'package:bloc_login/loading.dart';
import 'package:bloc_login/login_screen/login_screen.dart';
import 'package:bloc_login/popupmenu/popupmenu_clickall.dart';
import 'package:bloc_login/popupmenu/popupmenu_filter.dart';
import 'package:bloc_login/todo/todo_bloc.dart';
import 'package:bloc_login/todo/todo_state.dart';
import 'package:bloc_login/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatelessWidget {
  final String name;

  HomeScreen({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserRepository _userRepository = RepositoryProvider.of(context);
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, active) => Stack(children: [
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Todo',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            actions: <Widget>[
              // ignore: unrelated_type_equality_checks
              FilterButton(),
              PopupMenuClickAll(),
              IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute( builder: (context) => LoginScreen(userRepository: _userRepository ,)));
                }

              )

            ],
          ),
          // body: BlocBuilder<FilterBloc,FilterState>(
          //   builder:(context, state){
          //     if( state is FilterLoading){
          //       return Loading();
          //     }
          //     else if( state is FilterLoaded ){
          //       final todos = state.filter;
          //       return ListView.builder(
          //           itemCount: todos.length,
          //           itemBuilder: (context, index ){
          //             final todo = todos[index];
          //             return ItemTodo(
          //                todo: todo,
          //                 index: index,
          //             );
          //           });
          //      }
          //     else{
          //       return Container();
          //     }
          //   },
          // ),
          body: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state){
                if( state is TodoLoading ){
                  return Loading();
                }
                else if( state is TodoLoaded){
                  final todos = state.filterd;

                  return ListView.builder(
                      itemCount: todos.length ,
                      itemBuilder: (context, index){
                        final todo = todos[index];
                        return ItemTodo(
                            todo: todo,
                            index: index);
                      });
                }
                else{
                  return Container();
                }
              }),
            floatingActionButton: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.blue[300],
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddTask())),
            ),
          ),
        ),
      ]),
    );
  }
}
//

