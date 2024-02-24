class AuthParams {
  final String email;
  final String password;

  AuthParams({required this.email, required this.password});
}

class UserParams {
  final String id;
  final List<String> todoList;

  UserParams({required this.id, required this.todoList});

}