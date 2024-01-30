import 'package:ecommerce_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/usecases/base_usecase.dart';
import 'package:ecommerce_app/features/authentication/domain/entities/user.dart';
import 'package:ecommerce_app/features/authentication/domain/repository/auth_base_repository.dart';
import 'package:equatable/equatable.dart';

class RegisterUsecase implements BaseUsecase<User, RegisterParams> {
  final BaseAuthRepository _baseAuthRepository;

  RegisterUsecase(this._baseAuthRepository);
  @override
  Future<Either<Failure, User>> call(RegisterParams registerParams) async {
    return await _baseAuthRepository.regiterUser(registerParams);
  }
}

class RegisterParams extends Equatable {
  final String name;
  final String phone;
  final String email;
  final String password;

  const RegisterParams({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        name,
        phone,
        email,
        password,
      ];
}
