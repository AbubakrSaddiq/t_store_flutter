import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user_model.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  ///save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        //   convert names to first name and last name
        final nameParts = UserModel.nameParts(
            userCredentials.user!.displayName ?? '');
        final username = UserModel.generateUserName(
            userCredentials.user!.displayName ?? '');

        //   map data
        final user = UserModel(id: userCredentials.user!.uid,
            username: username,
            email: userCredentials.user!.email ?? '',
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.phoneNumber ?? '');

      //   save user data
        await userRepository.createUser(user);
      }
    } catch (e) {
      StoreLoaders.warningSnackBar(title: 'Data not save',
          message: 'Something went wrong. You can retry saving in your Profile');
    }
  }

}