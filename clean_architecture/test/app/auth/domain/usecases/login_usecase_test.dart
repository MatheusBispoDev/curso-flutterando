import 'package:clean_architecture/app/auth/domain/entities/logged_user.dart';
import 'package:clean_architecture/app/auth/domain/errors/errors.dart';
import 'package:clean_architecture/app/auth/domain/repository/auth_repository.dart';
import 'package:clean_architecture/app/auth/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

class AuthRepositoryMock implements AuthRepository {
  @override
  Future<Either<AuthException, LoggedUser>> login(
      CredentialsParams params) async {
    if (params.password == '1234') {
      return Left(AuthException('repository error'));
    }

    // Quando der certo, retorna o LoggedUser
    return Right(LoggedUser(email: params.email, name: 'Matheus'));

    //return LoggedUser(email: params.email, name: 'Matheus');
  }
}

void main() {
  final repostiroy = AuthRepositoryMock();
  final usecase = LoginUseCase(repostiroy);
  test('deve efetuar login', () async {
    final result = await usecase.execute(
      CredentialsParams(
        email: 'matheus@gmail.com.br',
        password: '123',
      ),
    );
    expect(result.isRight(), true);
    expect(
        result
            .getOrElse(
              () => LoggedUser(name: '', email: ''),
            )
            .name,
        'Matheus');

    // Código da forma que desrespeitava o Single Responsability Principle, pois o tratamento de erro estava sendo feito no usecase
    //expect(result, isA<LoggedUser>());
    //expect(result.name, 'Matheus');
  });
  test('deve dar erro quando o email for invalido', () async {
    final result = await usecase.execute(
      CredentialsParams(
        email: 'matheus',
        password: '123',
      ),
    );

    //final leftValue = result.fold(id, id) as AuthException; // Para pegar e testar melhor esse retorno de excecao

    expect(result.isLeft(), true);

    // Chama uma função assincrona (async => await) para testar excecao
    //expect(() async => await result, throwsA(isA<AuthException>()));
  });
  test('deve dar erro quando o password for vazio', () async {
    final result = await usecase.execute(
      CredentialsParams(
        email: 'matheus',
        password: '',
      ),
    );

    expect(result.isLeft(), true);
    // Chama uma função assincrona (async => await) para testar excecao
    //expect(() async => await result, throwsA(isA<AuthException>()));
  });
  test('deve dar erro quando o repository falhar', () async {
    final result = await usecase.execute(
      CredentialsParams(
        email: 'matheus@gmail.com.br',
        password: '1234',
      ),
    );

    expect(result.isLeft(), true);
    //  Chama uma função assincrona (async => await) para testar excecao
    //expect(() async => await result, throwsA(isA<AuthException>()));
  });
}
