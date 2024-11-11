import 'package:app_academia/data/repositories/data_firebase/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:app_academia/domain/repositories/user_repository.dart';
import 'package:app_academia/interactor/actions/fetch_user_data.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  getIt.registerLazySingleton<FetchUserData>(
      () => FetchUserData(getIt<UserRepository>()));
}
