import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/authentication/domain/entities/user.dart';
import 'package:ecommerce_app/features/authentication/domain/usecases/register_usecase.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, User>> loginUser(String email, String password);
  Future<Either<Failure, User>> regiterUser(
    RegisterParams registerParams,
  );
}
