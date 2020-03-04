import 'dart:async';
import 'dart:convert';
import 'package:githubapibloc/src/models/user_response.dart';
import 'package:http/http.dart' as http; //or as show client

class UserApiProvider {
  // Client client = Client();
  static const baseUrl = 'http://api.github.com';

  Future<UserResponse> fetchUserList() async {
    final response = await http.get("$baseUrl/users");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return UserResponse.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
