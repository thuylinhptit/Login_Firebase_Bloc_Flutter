import 'file:///F:/Flutter/bloc_login/lib/register_screen/register_screen.dart';
import 'file:///F:/Flutter/bloc_login/lib/user_repository/user_repository.dart';
import 'package:flutter/material.dart';

class CreateAccountButton extends StatelessWidget {
  final UserRepository _userRepository;

  CreateAccountButton({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        'Create an Account',
      ),
      onPressed: () {
        print("press Create an account");
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return RegisterScreen(userRepository: _userRepository);
          }),
        );
      },
    );
  }
}