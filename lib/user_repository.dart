import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:widget_testing/user_model.dart';

class UserRepository {
  const UserRepository();

  Future<List<UserModel>> getUsers() async {
    final response = await http.Client()
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => UserModel.fromMap(json)).toList();
    }
    throw Exception('Some Error Occurred');
  }
}
