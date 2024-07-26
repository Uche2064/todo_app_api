import 'package:get/get.dart';
import 'package:todo_app_api/model/todo_model.dart';
import 'package:todo_app_api/service/remote_todo_service.dart';

class TodoController extends GetxController {
  var listTodo = <TodoModel>[].obs;

  @override
  void onInit() {
    fetchTodos();
    super.onInit();
  }

  void fetchTodos() async {
    var todosFromServiceFolder = await RemoteTodoService.fetchTodoFromApi();

    if (todosFromServiceFolder != null) {
      listTodo(todosFromServiceFolder.todos);
    }
  }
}
