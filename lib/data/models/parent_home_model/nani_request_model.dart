import 'package:equatable/equatable.dart';

class NaniRequestModel extends Equatable {
  final String? from;
  final String? to;
  final String? parentAddressId;
  final String? notes;
  final String? couponCode;
  final bool? webcam;
  final int? additionalChildren;
  final List<String>? children;

  const NaniRequestModel({
    required this.from,
    required this.to,
    required this.parentAddressId,
    required this.notes,
    required this.couponCode,
    required this.webcam,
    required this.additionalChildren,
    required this.children,
  });

  factory NaniRequestModel.fromJson(Map<String, dynamic> json) => NaniRequestModel(
        from: json['from'] as String,
        to: json['to'] as String,
        parentAddressId: json['parent_address_id'] as String?,
        notes: json['notes'] as String?,
        couponCode: json['coupon_code'] as String?,
        webcam: json['webcam'] as bool?,
        additionalChildren: json['additional_children'] as int?,
        children: List<String>.from(json['children'] as List<dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'from': from,
        'to': to,
        'parent_address_id': parentAddressId,
        'notes': notes,
        'coupon_code': couponCode,
        'webcam': webcam,
        'additional_children': additionalChildren,
        'children': children,
      };

  @override
  List<Object?> get props => [
        from,
        to,
        parentAddressId,
        notes,
        couponCode,
        webcam,
        additionalChildren,
        children,
      ];
}