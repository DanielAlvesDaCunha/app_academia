import 'package:app_academia/data/repositories/data_firebase/user_model.dart';
import 'package:app_academia/domain/repositories/user_repository.dart';

class FetchUserData {
  final UserRepository userRepository;

  FetchUserData(this.userRepository);

  Future<UserModel> call(int id) async {
    return await userRepository.getUser(id);
  }
}
