import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String name;

  final String email;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'email': email});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(id: $id, name: $name, email: $email)';

  @override
  List<Object> get props => [id, name, email];
}
