//MARK: Login Response
class UserResponse {
  final String token;
  final User data;
  final String status;

  UserResponse({required this.token, required this.status, required this.data});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      token: json['token'],
      data: User.fromJson(json['user']),
      status: json['status'],
    );
  }
}

class User {
  final int userId;
  final String name;
  final String email;
  final String nameUpperCase;

  User(
      {required this.userId,
      this.name = "",
      required this.email,
      required this.nameUpperCase});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['id'],
      name: json['name'],
      email: json['email'],
      nameUpperCase: json['name_upper_case'],
    );
  }
}
