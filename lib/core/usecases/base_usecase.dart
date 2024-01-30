import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUsecase<T, Parameter> {
  Future<Either<Failure, T>> call(Parameter parameter);
}

class NoParameter extends Equatable {
  const NoParameter();

  @override
  List<Object?> get props => [];
}
