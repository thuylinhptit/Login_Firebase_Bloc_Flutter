import 'package:bloc_login/loading.dart';
import 'package:bloc_login/stats/stats_bloc.dart';
import 'package:bloc_login/stats/stats_state.dart';
import 'package:bloc_login/todo/todo_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Stats extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatsBloc(todosBloc: BlocProvider.of<TodoBloc>(context)),
      child: BlocBuilder<StatsBloc, StatsState>(
        builder: (context, state){
          if( state is StatsLoading){
            return Loading();
          }
          else if( state is StatsLoaded){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Todo Completed", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text(
                    "${state.numberCompleted}", style: TextStyle( fontSize: 18, color: Colors.black),
                  ),
                  Text(
                    "Todo Incompleted",  style: TextStyle( fontWeight: FontWeight.bold, fontSize: 25)
                  ),
                  Text(
                    "${state.numberIncompleted}",  style: TextStyle( fontSize: 18, color: Colors.black),
                  )
                ],
              ),
            );
          }
          else{
            return Container();
          }
        },
      ),
    );
  }
  
}
