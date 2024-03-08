import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';

import '../models/User.dart';

class AuthServices {
  Future<void> createUser(User user) async {
    try {
      final request = ModelMutations.create(user);
      final response = await Amplify.API.mutate(request: request).response;

      final createdUser = response.data;
      if (createdUser == null) {
        safePrint('addUser errors: ${response.errors}');
        return;
      }
    } on Exception catch (error) {
      safePrint('addUser failed: $error');
    }
  }
}
