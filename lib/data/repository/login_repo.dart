import 'package:parent_app/data/models/parent_user_model/parent_user_model.dart';
import 'package:parent_app/feature/settings/cache_services.dart';
import 'package:parent_app/network/network_constants.dart';
import 'package:parent_app/network/network_manager_clone.dart';

class LoginRepo {
  Future<ParentUserModel> parentUserLogin(
      {required String mail, required String password}) async {
    try {
      ParentUserModel? userModel;
      final response = await NetworkManagerClone().post(endPointloginParent,
          body: {"email": mail, "password": password});

      userModel = ParentUserModel.fromJson(response);
      await CacheServices.instance.setParentModel(userModel);
      return userModel;
    } catch (e, st) {
      rethrow;
    }
  }
}
