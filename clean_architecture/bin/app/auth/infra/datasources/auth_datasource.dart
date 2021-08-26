import '../../domain/entities/logged_user.dart';
import '../../domain/usecases/login_usecase.dart';

abstract class AuthDatasource {
  Future<LoggedUser> login(CredentialsParams params);
}
