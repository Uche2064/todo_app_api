import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app_api/controller/todo_controller.dart';
import 'package:todo_app_api/controller/user_controller.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(
          "Users",
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: userController.listUser.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                child: Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      "${userController.listUser[index].lastName} ${userController.listUser[index].username}",
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                    subtitle: Text(
                      userController.listUser[index].email,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                      ),
                    ),
                    trailing: Text(
                      userController.listUser[index].bloodGroup,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
