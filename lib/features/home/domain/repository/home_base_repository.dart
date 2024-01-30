import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/home/domain/entities/bannares_entity.dart';
import 'package:ecommerce_app/features/home/domain/entities/categories_entity.dart';
import 'package:ecommerce_app/features/home/domain/entities/category_detials_entity.dart';
import 'package:ecommerce_app/features/home/domain/entities/home_entity.dart';
import 'package:ecommerce_app/features/home/domain/usecases/get_category_details_usecase.dart';

abstract class HomeBaseRepository {
  Future<Either<Failure, List<Banners>>> getBanners();
  Future<Either<Failure, Home>> getHomeData();
  Future<Either<Failure, List<Categories>>> getCategories();
  Future<Either<Failure, CategoryDetailsData>> getCategoriesDetails(
      CatDetailsParams catDetailsParams);
}
