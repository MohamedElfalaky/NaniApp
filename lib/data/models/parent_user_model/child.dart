import 'package:equatable/equatable.dart';

class Child extends Equatable {
  final String? id;
  final String? name;
  final String? gender;
  final int? age;

  const Child({this.id, this.name, this.gender, this.age});

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        id: json['id'] as String?,
        name: json['name'] as String?,
        gender: json['gender'] as String?,
        age: json['age'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'gender': gender,
        'age': age,
      };

  @override
  List<Object?> get props => [id, name, gender, age];
}
