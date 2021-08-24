import 'package:clean_architecture/app/auth/domain/entities/logged_user.dart';
import 'package:clean_architecture/app/auth/domain/errors/errors.dart';
import 'package:clean_architecture/app/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:string_validator/string_validator.dart';

abstract class ILoginUseCase {
  // Delegou responsabilidade, assim com o Either o repository que irá cuidar do tratamento de erros
  // Caso seja o valor verdadeiro retornará o LoggedUser, caso seja um valor falso retornará o AuthException
  Future<Either<AuthException, LoggedUser>> execute(CredentialsParams params);
}

class LoginUseCase implements ILoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  // *Em casos onde a classe só tem um metódo, podemos mudar o nome dele para call, e assim a chamada da função sera a instancia da classe
  @override
  Future<Either<AuthException, LoggedUser>> execute(
      CredentialsParams params) async {
    if (!isEmail(params.email)) {
      // Ao invés de retornar uma excecao e causar problemas no sistemas, retorna uma excecao pois o tratamento será feito pelo repository
      return Left(AuthException('Error email'));
      // Dispara uma excecao, *pode causar podemas para o usuário / não é responsábilidade do usecase tratar erros, e sim do repository
      //throw AuthException('Error email');
    }
    if (params.password.isEmpty) {
      return Left(AuthException('Error password'));
      //throw AuthException('Error password');
    }

    return await repository.login(params);

    /*    try {
      return await repository.login(params);
    } catch (e) {
      throw AuthException('Repository error');
    }    */
  }
}

// É melhor criar uma nova classe para servir de parâmetos,
// para caso seja necessário alterar os parâmetros, só precisaremos alterar na classe. E não afetará a regra de negócio
class CredentialsParams {
  final String email;
  final String password;

  CredentialsParams({required this.email, required this.password});
}
