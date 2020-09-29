import 'file:///F:/Flutter/bloc_login/lib/popupmenu/click_all.dart';
import 'package:bloc_login/add_edit_task.dart';
import 'package:bloc_login/login_screen/login_screen.dart';
import 'file:///F:/Flutter/bloc_login/lib/popupmenu/choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final String name;


  HomeScreen({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [ Scaffold(
        appBar: AppBar(
          title: Text('Todo', style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
          actions: <Widget>[
            BlocBuilder(
              builder: (context, active){
                return PopupMenuButton(
                  onSelected: (Choice choice){
                    _select(choice, context);
                  },
                  icon: Icon(Icons.menu),
                  itemBuilder: (BuildContext context) {
                    return choice.map((Choice choice) {
                      var color = Colors.black87;
                      if( choice.index == 1 && status == TodoStatus.allTodo
                          || choice.index == 2 && status == TodoStatus.notCompleted
                          || choice.index == 3 && status == TodoStatus.completed
                      ) {
                        color= Colors.blue;
                      }
                      return PopupMenuItem<Choice>(
                          value: choice,
                          child: Text(choice.title, style: TextStyle( color:  color), ));
                    }).toList();
                  },
                );

              },
            ),
            PopupMenuButton(
              onSelected: (ClickAll clickAll ){
                _selectClickAll(clickAll, context);

              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) {
                return listClickAll.map((ClickAll clickAll) {
                  return PopupMenuItem<ClickAll>(
                    value: clickAll,
                    child: Text(clickAll.title),
                  );
                }).toList();
              },
            ),
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute( builder: (context) => LoginScreen())),
            )

          ],
        ),
   //     body: ListTodo();
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(0,0 , 20, 20),
          child: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.blue[300],
            onPressed: () => Navigator.push(context, MaterialPageRoute(  builder:  (context) => AddTask())),
          ),
        ),
      ),
      ]
    );
  }
}

void _select ( Choice choice , BuildContext context ){
 // BlocProvider.of(context).
}

void _selectClickAll ( ClickAll clickAll, BuildContext context){
  var todoBlocProvider = BlocProvider.of(context);
  if( clickAll.index == 1 ){
    //todoBlocProvider.DoneAll
  }
  else{
    //
  }
}
