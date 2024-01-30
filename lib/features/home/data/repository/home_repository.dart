import 'package:ecommerce_app/core/error/exceptions.dart';
import 'package:ecommerce_app/features/home/data/datasource/remote_data_source.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/home/domain/entities/bannares_entity.dart';
import 'package:ecommerce_app/features/home/domain/entities/categories_entity.dart';
import 'package:ecommerce_app/features/home/domain/entities/category_detials_entity.dart';
import 'package:ecommerce_app/features/home/domain/entities/home_entity.dart';
import 'package:ecommerce_app/features/home/domain/repository/home_base_repository.dart';
import 'package:ecommerce_app/features/home/domain/usecases/get_category_details_usecase.dart';

class HomeRepository implements HomeBaseRepository {
  final HomeBaseRemoteDataSource _homeBaseRemoteDataSource;

  HomeRepository(this._homeBaseRemoteDataSource);
  @override
  Future<Either<Failure, Home>> getHomeData() async {
    try {
      final result = await _homeBaseRemoteDataSource.getHomeData();
      //  AppConstants.printFullText('naaaaana $result}');
      return Right(result);
    } on ServerExceptions catch (failure) {
      return left(
        ServerFailure(
            failure.errorMessageModel.message ?? 'Found an errorrrrr'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Banners>>> getBanners() async {
    try {
      final result = await _homeBaseRemoteDataSource.getBanners();
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.message ?? 'the Message is null',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Categories>>> getCategories() async {
    try {
      final result = await _homeBaseRemoteDataSource.getCategories();
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(
        ServerFailure(
            failure.errorMessageModel.message ?? 'the Message is null'),
      );
    }
  }

  @override
  Future<Either<Failure, CategoryDetailsData>> getCategoriesDetails(
      CatDetailsParams catDetailsParams) async {
    try {
      final result =
          await _homeBaseRemoteDataSource.getCategoryDetials(catDetailsParams);

      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message!));
    }
  }
}
