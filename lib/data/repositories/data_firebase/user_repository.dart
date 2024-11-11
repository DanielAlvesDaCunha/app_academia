import 'package:app_academia/data/repositories/data_firebase/user_model.dart';
import 'package:app_academia/domain/repositories/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<UserModel> getUser(int id) async {
    var snapshot = await firestore.collection('users').doc(id.toString()).get();
    if (snapshot.exists) {
      final data = snapshot.data();
      if (data != null) {
        return UserModel.fromMap(data);
      } else {
        throw Exception('Dados do usuário são nulos');
      }
    } else {
      throw Exception('Usuário não encontrado');
    }
  }

  @override
  Future<void> saveUser(UserModel user) async {
    await firestore
        .collection('users')
        .doc(user.id.toString())
        .set(user.toMap());
  }
}
