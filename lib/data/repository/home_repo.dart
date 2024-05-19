import 'package:parent_app/data/models/parent_home_model/nani_request_model.dart';

import '../../network/network_constants.dart';
import '../../network/network_manager_clone.dart';

class ParentHomeRepo {
  Future<Map<String, dynamic>> getPrice({
    required List<String> childrenId,
    required int additionalChildren,
    required String parentId,
  }) async {
    try {
      final response = await NetworkManagerClone().post(
        '/parents/$parentId$endPointgetPrice',
        body: {
          "children": childrenId,
          "additional_children": additionalChildren,
        },
      );
      return response;
    } catch (e, st) {
      rethrow;
    }
  }

  Future<NaniRequestModel> requestNani({
    required String parentId,
    required String from,
    required String to,
    required String parentAddressId,
    required String notes,
    required String couponCode,
    required bool webcam,
    required int additionalChildren,
    required List<String> children,
  }) async {
    try {
      final response = await NetworkManagerClone().post(
        '/parents/$parentId$endPointnaniRequest',
        body: {
          "from": from,
          "to": to,
          "parent_address_id": parentAddressId,
          "notes": notes,
          "coupon_code": couponCode,
          "webcam": webcam,
          "additional_children": additionalChildren,
          "children": children,
        },
      );

      return NaniRequestModel.fromJson(response);
    } catch (e, st) {
      rethrow;
    }
  }
}
