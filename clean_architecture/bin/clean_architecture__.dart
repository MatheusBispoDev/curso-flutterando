import 'app/auth/domain/usecases/login_usecase.dart';
import 'app/auth/external/firebase/firebase_auth_impl.dart';
import 'app/auth/infra/datasources/auth_datasource.dart';
import 'app/auth/infra/repository/auth_repository.impl.dart';
import 'package:kiwi/kiwi.dart';

final container = KiwiContainer()
  ..registerFactory((container) => LoginUseCase(container.resolve()))
  ..registerFactory<AuthRepositoryImpl>(
      (container) => AuthRepositoryImpl(container.resolve()))
  ..registerFactory<AuthDatasource>((container) => FirebaseAuth());

void main(List<String> args) {
  // Usa o get_it para fazer o gerenciamento de injeção de controles

  final usecase = container.resolve<LoginUseCase>();

  //final usecase = LoginUseCase(AuthRepositoryImpl(FirebaseAuth()));
  //final use2case = LoginUseCase(AuthRepositoryImpl(AuthApi()));
}
