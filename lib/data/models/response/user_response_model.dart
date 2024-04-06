import 'dart:convert';

class UserResponseModel {
    final int id;
    final String name;
    final String email;
    final String roles;

    UserResponseModel({
        required this.id,
        required this.name,
        required this.email,
        required this.roles,
    });

    factory UserResponseModel.fromJson(String str) => UserResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserResponseModel.fromMap(Map<String, dynamic> json) => UserResponseModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        roles: json["roles"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "roles": roles,
    };
}
