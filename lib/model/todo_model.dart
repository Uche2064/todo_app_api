// To parse this JSON data, do
//
//     final TodoModel = TodoModelFromJson(jsonString);

import 'dart:convert';

Todo todoModelFromJson(String str) => Todo.fromJson(json.decode(str));

String todoModelToJson(TodoModel data) => json.encode(data.toJson());

class Todo {
  List<TodoModel> todos;
  int total;
  int skip;
  int limit;

  Todo({
    required this.todos,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        todos: List<TodoModel>.from(json["todos"].map((x) => TodoModel.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "todos": List<dynamic>.from(todos.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class TodoModel {
  int id;
  String todo;
  bool completed;
  int userId;

  TodoModel({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json["id"],
        todo: json["todo"],
        completed: json["completed"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
        "completed": completed,
        "userId": userId,
      };
}
