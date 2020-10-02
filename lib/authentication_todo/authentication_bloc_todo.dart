import 'package:bloc/bloc.dart';
import 'package:bloc_login/authentication/authentication_event.dart';
import 'package:bloc_login/authentication_todo/authentication_state_todo.dart';
import 'package:bloc_login/user_repository/user_repository_todo.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationTodoBloc extends Bloc<AuthenticationEvent, AuthenticationTodoStates>{
  final UserRepoditoryTodo _userRepoditoryTodo ;

  AuthenticationTodoBloc({@required UserRepoditoryTodo userRepoditoryTodo})
      : assert(userRepoditoryTodo != null ), _userRepoditoryTodo = userRepoditoryTodo, super(Uninitialized());

  @override
  Stream<AuthenticationTodoStates> mapEventToState(AuthenticationEvent event) async*{
    if( event is AppStarted ){
      yield* _maptoEventToState();
    }
  }

  Stream <AuthenticationTodoStates>  _maptoEventToState() async*{
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