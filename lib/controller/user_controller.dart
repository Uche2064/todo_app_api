import 'package:get/get.dart';
import 'package:todo_app_api/model/user_model.dart';
import 'package:todo_app_api/service/remote_users_service.dart';

class UserController extends GetxController {
  var listUser = <UserModel>[].obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    var userFromRemoteServiceFolder =
        await RemoteUsersService.fetchUserFromApi();

    if (userFromRemoteServiceFolder != null) {
      listUser(userFromRemoteServiceFolder.users);
    }
  }
}
