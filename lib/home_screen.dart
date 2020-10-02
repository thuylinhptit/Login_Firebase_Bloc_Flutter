import 'package:bloc_login/add_edit_task.dart';
import 'package:bloc_login/item_task.dart';
import 'package:bloc_login/loading.dart';
import 'package:bloc_login/login_screen/login_screen.dart';
import 'package:bloc_login/popupmenu/choice.dart';
import 'package:bloc_login/popupmenu/click_all.dart';
import 'package:bloc_login/popupmenu_clickall.dart';
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
    UserRepository _userRepository;
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
              // BlocBuilder(
              //   builder: (context, active){
              //     return PopupMenuButton(
              //       onSelected: (Choice choice){
              //         _select(choice, context);
              //       },
              //       icon: Icon(Icons.menu),
              //       itemBuilder: (BuildContext context) {
              //         return choice.map((Choice choice) {
              //           var color = Colors.black87;
              //           if( choice.index == 1 && status == TodoStatus.allTodo
              //               || choice.index == 2 && status == TodoStatus.notCompleted
              //               || choice.index == 3 && status == TodoStatus.completed
              //           ) {
              //             color= Colors.blue;
              //           }
              //           return PopupMenuItem<Choice>(
              //               value: choice,
              //               child: Text(choice.title, style: TextStyle( color:  color), ));
              //         }).toList();
              //       },
              //     );
              //   },
              // ),
              // PopupMenuButton(
              //   onSelected: (ClickAll clickAll ){
              //     _selectClickAll(clickAll, context);
              //   },
              //   icon: Icon(Icons.more_vert),
              //   itemBuilder: (BuildContext context) {
              //     return listClickAll.map((ClickAll clickAll) {
              //       return PopupMenuItem<ClickAll>(
              //         value: clickAll,
              //         child: Text(clickAll.title),
              //       );
              //     }).toList();
              //   },
               //),
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
          body: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state){
                if( state is TodoLoading ){
                  return Loading();
                }
                else if( state is TodoLoaded){
                  final todos = state.todos;
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
void _select ( Choice choice , BuildContext context ){

}

void _selectClickAll(ClickAll clickAll, BuildContext context) {
  var todoBlocProvider = BlocProvider.of(context);
  if (clickAll.index == 1) {
    //todoBlocProvider.DoneAll
  } else {
    //
  }
}
