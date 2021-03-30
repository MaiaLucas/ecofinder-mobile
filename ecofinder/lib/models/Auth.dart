class Auth {
  final String token;
  final String user;

  Auth({this.token, this.user});

  factory Auth.fromJson(Map<dynamic, dynamic> json) {
    return Auth(token: json['token'], user: json['user']);
  }
}
