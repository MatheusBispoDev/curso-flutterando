import '../../domain/entities/logged_user.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../infra/datasources/auth_datasource.dart';
import 'firebase_auth_mapper.dart';

class FirebaseAuth implements AuthDatasource {
  @override
  Future<LoggedUser> login(CredentialsParams params) async {
    final map = {'name': 'Matheus', 'email': 'matheus@gmail.com'};

    return LoggedUserMapper.fromJson(map);
  }
}
