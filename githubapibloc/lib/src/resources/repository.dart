import 'dart:async';

import 'package:githubapibloc/src/models/user_response.dart';

import 'user_api_provider.dart';

class Repository {
  final moviesApiProvider = UserApiProvider();

  Future<UserResponse> fetchUsers() => moviesApiProvider.fetchUserList();
}
