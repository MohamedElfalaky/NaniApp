import 'package:equatable/equatable.dart';

class ParentAddress extends Equatable {
  final String? id;
  final String? district;
  final String? streetAddress;
  final int? buildingNo;
  final int? appartmentNo;
  final String? remarkableLandmark;
  final int? longitude;
  final int? latitude;

  const ParentAddress({
    this.id,
    this.district,
    this.streetAddress,
    this.buildingNo,
    this.appartmentNo,
    this.remarkableLandmark,
    this.longitude,
    this.latitude,
  });

  factory ParentAddress.fromJson(Map<String, dynamic> json) => ParentAddress(
        id: json['id'] as String?,
        district: json['district'] as String?,
        streetAddress: json['street_address'] as String?,
        buildingNo: json['building_no'] as int?,
        appartmentNo: json['appartment_no'] as int?,
        remarkableLandmark: json['remarkable_landmark'] as String?,
        longitude: json['longitude'] as int?,
        latitude: json['latitude'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'district': district,
        'street_address': streetAddress,
        'building_no': buildingNo,
        'appartment_no': appartmentNo,
        'remarkable_landmark': remarkableLandmark,
        'longitude': longitude,
        'latitude': latitude,
      };

  @override
  List<Object?> get props {
    return [
      id,
      district,
      streetAddress,
      buildingNo,
      appartmentNo,
      remarkableLandmark,
      longitude,
      latitude,
    ];
  }
}
