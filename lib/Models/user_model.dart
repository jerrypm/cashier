class LoginResponse {
  final String status;
  final String message;
  final User data;

  LoginResponse(
      {required this.status, required this.message, required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      message: json['message'],
      data: User.fromJson(json['data']),
    );
  }
}

class User {
  final int userId;
  final String username;
  final String password;
  final String email;
  final String token;

  User(
      {required this.userId,
      this.username = "",
      this.password = "",
      required this.email,
      required this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
      token: json['token'],
    );
  }
}
