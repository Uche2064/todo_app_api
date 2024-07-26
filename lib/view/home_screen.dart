import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app_api/controller/todo_controller.dart';
import 'package:todo_app_api/view/users_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TodoController todoController = Get.put(TodoController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todo app with api fetch",
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const UsersScreen());
              },
              icon: const Icon(Icons.person))
        ],
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: todoController.listTodo.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                child: Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      "Id: ${todoController.listTodo[index].id}",
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                    subtitle: Text(
                      todoController.listTodo[index].todo,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                      ),
                    ),
                    trailing: Checkbox(
                      onChanged: (value) {},
                      value: todoController.listTodo[index].completed,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
