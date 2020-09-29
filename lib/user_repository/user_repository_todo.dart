abstract class UserRepoditoryTodo{
  Future<bool> isAuthenticated();
  Future<void> authentication();
  Future<String> getUserId();
}