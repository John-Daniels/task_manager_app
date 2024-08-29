class User {
  User({
    required this.fullName,
    required this.email,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.token,
  });

  String fullName;
  String email;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String? token;

  String? get firstName => fullName.split(' ')[0];

  factory User.fromJson(Map<dynamic, dynamic> json) => User(
        fullName: json["fullName"] ?? 'Anonymous',
        email: json["email"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "token": token,
      };
}
