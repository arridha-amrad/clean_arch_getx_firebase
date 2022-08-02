class Routes {
  static Future<String> get initialRoute async {
    return HOME;
  }

  static const ADD_TODO = '/add-todo';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const TODO_DETAIL = '/todo-detail';
}
