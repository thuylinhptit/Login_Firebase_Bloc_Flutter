import 'package:bloc_login/authentication_bloc.dart';
import 'package:bloc_login/authentication_event.dart';
import 'package:bloc_login/authentication_state.dart';
import 'package:bloc_login/home_screen.dart';
import 'package:bloc_login/login_screen.dart';
import 'package:bloc_login/simple_bloc_observer.dart';
import 'package:bloc_login/screen.dart';
import 'package:bloc_login/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main (){
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(userRepository:  userRepository)
      ..add(AppStarted()),
      child: App(userRepository: userRepository),

    )
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