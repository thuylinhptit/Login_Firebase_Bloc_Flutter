import 'package:bloc_login/register_bloc/register_bloc.dart';
import 'package:bloc_login/register_screen/register_form.dart';
import 'package:bloc_login/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterScreen extends StatelessWidget {
  final UserRepository _userRepository;

  RegisterScreen({ @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Center(
        child: BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(userRepository:  _userRepository),
          child: RegisterForm(),
        ),
      ),
    );
  }

}
