import 'package:ecommerce_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/usecases/base_usecase.dart';
import 'package:ecommerce_app/features/home/domain/entities/home_entity.dart';
import 'package:ecommerce_app/features/home/domain/repository/home_base_repository.dart';
import 'package:equatable/equatable.dart';

class GetHomeDataUsecase implements BaseUsecase<Home, NoParameters> {
  final HomeBaseRepository _homeBaseRepository;

  GetHomeDataUsecase(this._homeBaseRepository);
  @override
  Future<Either<Failure, Home>> call(NoParameters noParameters) async {
    return await _homeBaseRepository.getHomeData();
  }
}

class NoParameters extends Equatable {
  const NoParameters();
  @override
  List<Object?> get props => [];
}
