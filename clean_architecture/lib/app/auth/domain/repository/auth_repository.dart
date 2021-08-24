import 'package:clean_architecture/app/auth/domain/entities/logged_user.dart';
import 'package:clean_architecture/app/auth/domain/errors/errors.dart';
import 'package:clean_architecture/app/auth/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<AuthException, LoggedUser>> login(CredentialsParams params);
}
