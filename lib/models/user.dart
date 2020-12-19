import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;

  String name;
  String email;

  User({this.id, this.name});

  @override
  String toString() {
    return 'User { id: $id, name: $name, email: $email }';
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json["id"], name: json["name"])
      ..email = json['email'] ?? "";
  }

  factory User.fromDocument(DocumentSnapshot document) {
    var data = Map<String, dynamic>.from(document.data());
    data['id'] = document.id;

    return User.fromJson(data);
  }

  Map<String, dynamic> toJson() => {"id": id, "name": name};

  Map<String, dynamic> refData() => {"id": id, "name": name};
}
