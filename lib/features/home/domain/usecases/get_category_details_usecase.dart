import 'package:ecommerce_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/usecases/base_usecase.dart';
import 'package:ecommerce_app/features/home/domain/entities/category_detials_entity.dart';
import 'package:ecommerce_app/features/home/domain/repository/home_base_repository.dart';
import 'package:equatable/equatable.dart';

class GetCategoryDetailsUsecase
    implements BaseUsecase<CategoryDetailsData, CatDetailsParams> {
  final HomeBaseRepository _homeBaseRepository;

  GetCategoryDetailsUsecase(this._homeBaseRepository);
  @override
  Future<Either<Failure, CategoryDetailsData>> call(
      CatDetailsParams catDetailsParams) async {
    return await _homeBaseRepository.getCategoriesDetails(catDetailsParams);
  }
}

class CatDetailsParams extends Equatable {
  final int categoryId;

  const CatDetailsParams({required this.categoryId});

  @override
  List<Object?> get props => [
        categoryId,
      ];
}
