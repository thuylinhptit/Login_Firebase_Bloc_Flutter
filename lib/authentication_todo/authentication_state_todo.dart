import 'package:equatable/equatable.dart';

abstract class AuthenticationTodoStates extends Equatable{
  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationTodoStates{
  @override
  List<Object> get props =>[];

}

class Authentication extends AuthenticationTodoStates{
  final String userId;
  Authentication(this.userId);
  @override
  String toString() {
    return "Authentication";
  }
}

class Unauthentication extends AuthenticationTodoStates{
  @override
  String toString() {
    return "Unauthentication";
  }
}