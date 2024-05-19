import 'package:equatable/equatable.dart';

import 'child.dart';
import 'parent_address.dart';

class Parent extends Equatable {
  final String? id;
  final dynamic imageUrl;
  final String? fName;
  final String? lName;
  final String? phoneNumber;
  final String? email;
  final String? type;
  final String? nationality;
  final String? nidOrPassport;
  final String? dob;
  final bool? isActive;
  final DateTime? joinDate;
  final DateTime? lastEdit;
  final List<ParentAddress>? parentAddresses;
  final List<Child>? children;
  final dynamic nanny;
  final bool? authorizeWebcam;

  const Parent({
    this.id,
    this.imageUrl,
    this.fName,
    this.lName,
    this.phoneNumber,
    this.email,
    this.type,
    this.nationality,
    this.nidOrPassport,
    this.dob,
    this.isActive,
    this.joinDate,
    this.lastEdit,
    this.parentAddresses,
    this.children,
    this.nanny,
    this.authorizeWebcam,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        id: json['id'] as String?,
        imageUrl: json['image_url'] as dynamic,
        fName: json['f_name'] as String?,
        lName: json['l_name'] as String?,
        phoneNumber: json['phone_number'] as String?,
        email: json['email'] as String?,
        type: json['type'] as String?,
        nationality: json['nationality'] as String?,
        nidOrPassport: json['nid_or_passport'] as String?,
        dob: json['dob'] as String?,
        isActive: json['is_active'] as bool?,
        joinDate: json['join_date'] == null
            ? null
            : DateTime.parse(json['join_date'] as String),
        lastEdit: json['last_edit'] == null
            ? null
            : DateTime.parse(json['last_edit'] as String),
        parentAddresses: (json['parent_addresses'] as List<dynamic>?)
            ?.map((e) => ParentAddress.fromJson(e as Map<String, dynamic>))
            .toList(),
        children: (json['children'] as List<dynamic>?)
            ?.map((e) => Child.fromJson(e as Map<String, dynamic>))
            .toList(),
        nanny: json['Nanny'] as dynamic,
        authorizeWebcam: json['authorize_webcam'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image_url': imageUrl,
        'f_name': fName,
        'l_name': lName,
        'phone_number': phoneNumber,
        'email': email,
        'type': type,
        'nationality': nationality,
        'nid_or_passport': nidOrPassport,
        'dob': dob,
        'is_active': isActive,
        'join_date': joinDate?.toIso8601String(),
        'last_edit': lastEdit?.toIso8601String(),
        'parent_addresses': parentAddresses?.map((e) => e.toJson()).toList(),
        'children': children?.map((e) => e.toJson()).toList(),
        'Nanny': nanny,
        'authorize_webcam': authorizeWebcam,
      };

  @override
  List<Object?> get props {
    return [
      id,
      imageUrl,
      fName,
      lName,
      phoneNumber,
      email,
      type,
      nationality,
      nidOrPassport,
      dob,
      isActive,
      joinDate,
      lastEdit,
      parentAddresses,
      children,
      nanny,
      authorizeWebcam,
    ];
  }
}
