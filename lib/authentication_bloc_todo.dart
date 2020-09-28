import 'package:bloc/bloc.dart';
import 'package:bloc_login/authentication/authentication_event.dart';
import 'package:bloc_login/authentication_state_todo.dart';
import 'package:bloc_login/user_repository_todo.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationStates>{
  final UserRepoditoryTodo _userRepoditoryTodo ;

  AuthenticationBloc({@required UserRepoditoryTodo userRepoditoryTodo})
      : assert(userRepoditoryTodo != null ), _userRepoditoryTodo = userRepoditoryTodo, super(Uninitialized());

  @override
  Stream<AuthenticationStates> mapEventToState(AuthenticationEvent event) async*{
    if( event is AppStarted ){
      yield* _maptoEventToState();
    }
  }

  Stream <AuthenticationStates>  _maptoEventToState() async*{
    try{
      final isSignIn = await _userRepoditoryTodo.isAuthenticated();
      if( !isSignIn ){
        await _userRepoditoryTodo.authentication();
      }
      final userId = await _userRepoditoryTodo.getUserId();
      yield Authentication(userId);
    }catch(_){
      yield Unauthentication();
    }
}

}