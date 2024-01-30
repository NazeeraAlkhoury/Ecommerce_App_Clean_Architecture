import 'package:ecommerce_app/core/error/exceptions.dart';
import 'package:ecommerce_app/features/authentication/data/dataSource/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/authentication/domain/entities/user.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/authentication/domain/repository/auth_base_repository.dart';
import 'package:ecommerce_app/features/authentication/domain/usecases/register_usecase.dart';

class AuthRepository implements BaseAuthRepository {
  final AuthBaseRemoteDataSource baseAuthRemoteDataSource;

  AuthRepository(this.baseAuthRemoteDataSource);
  @override
  Future<Either<Failure, User>> loginUser(String email, String password) async {
    try {
      final result = await baseAuthRemoteDataSource.logInUser(
        email,
        password,
      );
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message!));
    }
  }

  @override
  Future<Either<Failure, User>> regiterUser(
      RegisterParams registerParams) async {
    try {
      final result =
          await baseAuthRemoteDataSource.registerUser(registerParams);
      return right(result);
    } on ServerExceptions catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.message!),
      );
    }
  }
}
