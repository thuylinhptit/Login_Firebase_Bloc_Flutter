import 'package:equatable/equatable.dart';

abstract class AuthenticationStates extends Equatable{
  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationStates{
  @override
  List<Object> get props =>[];
  @override
  String toString() {
    return "Uninitialized";
  }

}

class Authentication extends AuthenticationStates{
  final String userId;
  Authentication(this.userId);
  @override
  String toString() {
    return "Authentication";
  }
}

class Unauthentication extends AuthenticationStates{
  @override
  String toString() {
    return "Unauthentication";
  }
}