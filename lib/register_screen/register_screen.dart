import 'file:///F:/Flutter/bloc_login/lib/register_bloc/register_bloc.dart';
import 'file:///F:/Flutter/bloc_login/lib/register_screen/register_form.dart';
import 'file:///F:/Flutter/bloc_login/lib/user_repository/user_repository.dart';
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
          create: (context) => RegisterBloc(userRepository: _userRepository),
          child: RegisterForm(),
        ),
      ),
    );
  }

}
