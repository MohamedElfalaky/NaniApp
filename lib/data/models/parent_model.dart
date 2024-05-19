class ParentInfo {
  Parent parent;

  ParentInfo({required this.parent});

  Map<String, dynamic> toJson() => {
        "parent": parent.toJson(),
      };

  factory ParentInfo.fromJson(Map<String, dynamic> json) {
    return ParentInfo(
      parent: Parent.fromJson(json['parent']),
    );
  }
}

class Parent {
  String? fName;
  String? lName;
  String? phoneNumber;
  String? email;
  String? password;
  String? nidOrPassport;
  bool authorizeWebcam;
  String? dob;
  List<ParentAddress>? parentAddresses;
  List<ChildModel>? children;

  Parent({
    this.fName,
    this.lName,
    this.phoneNumber,
    this.email,
    this.password,
    this.nidOrPassport,
    this.authorizeWebcam = true,
    this.dob,
    this.parentAddresses,
    this.children,
  });

  Map<String, dynamic> toJson() => {
        "f_name": fName,
        "l_name": lName,
        "phone_number": phoneNumber,
        "email": email,
        "password": password,
        "nid_or_passport": nidOrPassport,
        "authorize_webcam": authorizeWebcam,
        "dob": dob,
        "parent_addresses": parentAddresses?.map((e) => e.toJson()).toList(),
        "children": children?.map((e) => e.toJson()).toList(),
      };

  factory Parent.fromJson(Map<String, dynamic> json) {
    return Parent(
      fName: json['f_name'],
      lName: json['l_name'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      password: json['password'],
      nidOrPassport: json['nid_or_passport'],
      authorizeWebcam: json['authorize_webcam'],
      dob: json['dob'],
      parentAddresses: List<ParentAddress>.from(
          json['parent_addresses'].map((x) => ParentAddress.fromJson(x))),
      children: List<ChildModel>.from(
          json['children'].map((x) => ChildModel.fromJson(x))),
    );
  }
}

class ParentAddress {
  String? district;
  String? streetAddress;
  int? buildingNo;
  int? apartmentNo;
  String? remarkableLandmark;
  double? longitude;
  double? latitude;

  ParentAddress({
    this.district,
    this.streetAddress,
    this.buildingNo,
    this.apartmentNo,
    this.remarkableLandmark,
    this.longitude,
    this.latitude,
  });

  Map<String, dynamic> toJson() => {
        "district": district,
        "street_address": streetAddress,
        "building_no": buildingNo,
        "appartment_no": apartmentNo,
        "remarkable_landmark": remarkableLandmark,
        // "longitude": longitude,
        // "latitude": latitude,
      };

  factory ParentAddress.fromJson(Map<String, dynamic> json) {
    return ParentAddress(
      district: json['district'],
      streetAddress: json['street_address'],
      buildingNo: json['building_no'],
      apartmentNo: json['appartment_no'],
      remarkableLandmark: json['remarkable_landmark'],
      // longitude: json['longitude'].toDouble(),
      // latitude: json['latitude'].toDouble(),
    );
  }
}

class ChildModel {
  DateTime? id;
  String? name;
  String? age;
  String? gender;
  List? prefActivities;

  ChildModel({
    this.id,
    this.name,
    this.gender,
    this.age,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "age": age,
      };

  factory ChildModel.fromJson(Map<String, dynamic> json) {
    return ChildModel(
      name: json['name'],
      gender: json['gender'],
      age: json['age'],
    );
  }
}
