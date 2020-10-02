import 'package:equatable/equatable.dart';

abstract class AuthenticationTodoEvent extends Equatable{
  @override
  List<Object> get props => [];

}

class StartApp extends AuthenticationTodoEvent{
  @override
  String toString() {
    return "Start App ";
  }
}
