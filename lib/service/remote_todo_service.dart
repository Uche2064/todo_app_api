import 'package:http/http.dart' as http;
import 'package:todo_app_api/model/todo_model.dart';

class RemoteTodoService {
  static var client = http.Client();

  static Future<Todo?> fetchTodoFromApi() async {
    var todos = await client.get(Uri.parse("https://dummyjson.com/todos?limit=100"));

    if (todos.statusCode == 200) {
      return todoModelFromJson(todos.body);
    } else {
      return null;
    }
  }
}
