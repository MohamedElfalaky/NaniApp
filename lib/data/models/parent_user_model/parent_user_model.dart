import 'package:equatable/equatable.dart';

import 'parent.dart';

class ParentUserModel extends Equatable {
  final String? token;
  final Parent? parent;

  const ParentUserModel({this.token, this.parent});

  factory ParentUserModel.fromJson(Map<String, dynamic> json) {
    return ParentUserModel(
      token: json['token'] as String?,
      parent: json['parent'] == null
          ? null
          : Parent.fromJson(json['parent'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'parent': parent?.toJson(),
      };

  @override
  List<Object?> get props => [token, parent];
}
