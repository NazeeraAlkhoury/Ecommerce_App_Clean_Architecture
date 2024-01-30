import 'package:ecommerce_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/usecases/base_usecase.dart';
import 'package:ecommerce_app/features/home/domain/entities/bannares_entity.dart';
import 'package:ecommerce_app/features/home/domain/repository/home_base_repository.dart';

class GetBannersUsecase extends BaseUsecase<List<Banners>, NoParameter> {
  final HomeBaseRepository homeBaseRepository;

  GetBannersUsecase(this.homeBaseRepository);

  @override
  Future<Either<Failure, List<Banners>>> call(NoParameter parameter) async {
    return await homeBaseRepository.getBanners();
  }
}
