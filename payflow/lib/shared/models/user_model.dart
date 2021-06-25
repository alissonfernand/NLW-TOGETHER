import 'dart:convert';

class UserModel {
  final String name;
  final String? photoURL;

  UserModel({required this.name, this.photoURL});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      photoURL: map['photoURL'],
    );
  }

  factory UserModel.fromJson(String json) {
    return UserModel.fromMap(
      jsonDecode(json),
    );
  }

  Map<String, dynamic> toMap() => {
        "name": name,
        "photoURL": photoURL,
      };

  String toJson() => jsonEncode(toMap());

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   data['photoURL'] = this.photoURL;
  //   return data;
  // }
}
