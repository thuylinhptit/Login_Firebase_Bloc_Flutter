import 'package:bloc_login/authentication/authentication_bloc.dart';
import 'package:bloc_login/authentication/authentication_event.dart';
import 'package:bloc_login/authentication/authentication_state.dart';
import 'package:bloc_login/bottomnavigation.dart';
import 'package:bloc_login/login_screen/login_screen.dart';
import 'package:bloc_login/login_screen/screen.dart';
import 'package:bloc_login/simple_bloc_observer.dart';
import 'package:bloc_login/stats/stats_bloc.dart';
import 'package:bloc_login/todo/todo_bloc.dart';
import 'package:bloc_login/todo_repository/todo_firebase_repository.dart';
import 'package:bloc_login/todo_repository/todo_repository.dart';
import 'package:bloc_login/user_repository/user_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  final UserRepository userRepository = UserRepository();
  final TodoRepository todoRepository = FirebaseRepository();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => userRepository,
        )
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(userRepository:  userRepository)
            ..add(AppStarted()),
        ),
        BlocProvider(
          create: (context) => TodoBloc(todosRepository: todoRepository),
        ),
      ], child:  App(userRepository: userRepository),),
    ),

  );
}

class App extends StatelessWidget{
  final UserRepository _userRepository;
  App({Key key, @required UserRepository userRepository })
  :assert(userRepository != null ),
  _userRepository = userRepository,
  super( key: key );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState >(
          builder: (context, state ){
            if( state is Uninitialized ){
              return Screen();
            }
            if( state is Authenticated){
              return MultiBlocProvider(
                providers: [
                  BlocProvider<StatsBloc>(
                    create: (context) => StatsBloc(
                      todosBloc: BlocProvider.of<TodoBloc>(context),
                    ),
                  ),
                ],
                child: BottomNavigation(),
              );

            }
            if( state is Unauthenticated){
              return LoginScreen(userRepository:  _userRepository ,);
            }
            return Container();
          })
      );
    }
  }
