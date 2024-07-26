import 'package:http/http.dart' as http;
import 'package:todo_app_api/model/user_model.dart';

class RemoteUsersService {
  static var client = http.Client();

  static Future<User?> fetchUserFromApi() async {
    var response = await client.get(Uri.parse("https://dummyjson.com/users"));

    if (response.statusCode == 200) {
      return userModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
