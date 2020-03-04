class UserResponse {
  List<User> users;
  UserResponse({this.users});
  UserResponse.fromJson(dynamic json) {
    users = new List<User>();
    json.forEach((v) {
      users.add(new User.fromJson(v));
    });
  }
}

class User {
  int id;
  String login;

  User({this.id, this.login});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
  }
}
