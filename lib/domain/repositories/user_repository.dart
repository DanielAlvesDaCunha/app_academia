import 'package:app_academia/data/repositories/data_firebase/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getUser(int id);
  Future<void> saveUser(UserModel user);
}
