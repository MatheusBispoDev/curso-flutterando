import '../../domain/entities/logged_user.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../infra/datasources/auth_datasource.dart';

class AuthApi implements AuthDatasource {
  @override
  Future<LoggedUser> login(CredentialsParams params) async {
    return LoggedUser(name: 'Matheus', email: 'matheus@gmail.com.br');
  }
}
