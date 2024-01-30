import 'package:ecommerce_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/usecases/base_usecase.dart';
import 'package:ecommerce_app/features/home/domain/entities/categories_entity.dart';
import 'package:ecommerce_app/features/home/domain/repository/home_base_repository.dart';

class GetCategoriesUsecase
    implements BaseUsecase<List<Categories>, NoParameter> {
  final HomeBaseRepository _homeBaseRepository;

  GetCategoriesUsecase(this._homeBaseRepository);
  @override
  Future<Either<Failure, List<Categories>>> call(NoParameter parameter) async {
    return await _homeBaseRepository.getCategories();
  }
}
