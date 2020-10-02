import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class EmailChanged extends RegisterEvent {
  final String email;
  EmailChanged({@required this.email});
  @override
  List<Object> get props => [email];
}

class PasswordChanged extends RegisterEvent {
  final String password;
  PasswordChanged({@required this.password});
  @override
  List<Object> get props => [password];

}

class Submitted extends RegisterEvent {
  final String email;
  final String password;
  Submitted({@required this.email, @required this.password});
  @override
  List<Object> get props => [email, password];

}