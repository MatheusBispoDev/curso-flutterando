import 'package:dartz/dartz.dart';
import '../../domain/entities/logged_user.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../datasources/auth_datasource.dart';

// O repository serve para tratamentos de erros, assim não devemos usar o on para especificar a excecao

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<Either<AuthException, LoggedUser>> login(
      CredentialsParams params) async {
    // *Só se deve tratar erros que conhecemos, para isso usamos o on, ou seja,
    try {
      final user = await datasource.login(params);
      return Right(user);
    } on AuthException catch (e) {
      return Left(e);
    } on Exception {
      return Left(AuthException('Exception Error'));
    }
  }
}
