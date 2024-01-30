import 'package:ecommerce_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/usecases/base_usecase.dart';
import 'package:ecommerce_app/features/authentication/domain/entities/user.dart';
import 'package:ecommerce_app/features/authentication/domain/repository/auth_base_repository.dart';
import 'package:equatable/equatable.dart';

class LogInUsecase implements BaseUsecase<User, LoginParams> {
  final BaseAuthRepository _baseAuthRepository;

  LogInUsecase(this._baseAuthRepository);
  @override
  Future<Either<Failure, User>> call(LoginParams loginParams) async {
    return await _baseAuthRepository.loginUser(
      loginParams.email,
      loginParams.password,
    );
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
