import 'file:///F:/Flutter/bloc_login/lib/authentication/authentication_bloc.dart';
import 'file:///F:/Flutter/bloc_login/lib/authentication/authentication_event.dart';
import 'file:///F:/Flutter/bloc_login/lib/authentication/authentication_state.dart';
import 'package:bloc_login/home_screen.dart';
import 'file:///F:/Flutter/bloc_login/lib/login_screen/login_screen.dart';
import 'package:bloc_login/simple_bloc_observer.dart';
import 'file:///F:/Flutter/bloc_login/lib/login_screen/screen.dart';
import 'file:///F:/Flutter/bloc_login/lib/todo/todo_bloc.dart';
import 'file:///F:/Flutter/bloc_login/lib/todo_repository/todo_firebase_repository.dart';
import 'file:///F:/Flutter/bloc_login/lib/todo_repository/todo_repository.dart';
import 'file:///F:/Flutter/bloc_login/lib/user_repository/user_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  final UserRepository userRepository = UserRepository();
  final TodoRepository todoRepository = FirebaseRepository();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => AuthenticationBloc(userRepository:  userRepository)
          ..add(AppStarted()),
      ),
      BlocProvider(
        create: (context) => TodoBloc(todosRepository: todoRepository),
      )
    ], child:  App(userRepository: userRepository),),

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
            return HomeScreen( name:  state.displayName,);
          }
          if( state is Unauthenticated){
            return LoginScreen(userRepository:  _userRepository ,);
          }
          return Container();
        },
      )
    );
  }


}