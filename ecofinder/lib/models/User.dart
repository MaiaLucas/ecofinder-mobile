class User {
  final String id;
  final String name;
  final String avatar;
  final String type;
  final String email;

  User({this.id, this.name, this.avatar, this.type, this.email});

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
      id: json['id'],
      name: json['full_name'],
      avatar: json['avatar'],
      type: json['type'],
      email: json['email'],
    );
  }
}
