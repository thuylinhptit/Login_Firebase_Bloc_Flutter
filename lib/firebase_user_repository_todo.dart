import 'package:bloc_login/user_repository_todo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUserRepositoryTodo extends UserRepoditoryTodo{
  final FirebaseAuth _firebaseAuth;

  FirebaseUserRepositoryTodo(this._firebaseAuth);
  @override
  Future<void> authentication() {
    return _firebaseAuth.signInAnonymously();
  }

  @override
  Future<String> getUserId() async{
    return ( await _firebaseAuth.currentUser).uid;
  }

  @override
  Future<bool> isAuthenticated() async{
    final currentUser =  await _firebaseAuth.currentUser;
    return currentUser != null;
  }

}