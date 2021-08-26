import 'package:dartz/dartz.dart';
import '../entities/logged_user.dart';
import '../errors/errors.dart';
import '../usecases/login_usecase.dart';

abstract class AuthRepository {
  Future<Either<AuthException, LoggedUser>> login(CredentialsParams params);
}
