// ignore_for_file: avoid_print

import 'package:ecommerce_app/core/error/exceptions.dart';
import 'package:ecommerce_app/core/netwok/api_constance.dart';
import 'package:ecommerce_app/core/netwok/error_model.dart';
import 'package:ecommerce_app/core/utils/app_constants.dart';

import 'package:ecommerce_app/core/utils/dio_helper.dart';
import 'package:ecommerce_app/end_points.dart';
import 'package:ecommerce_app/features/home/data/models/bannares_model.dart';
import 'package:ecommerce_app/features/home/data/models/categories_model.dart';
import 'package:ecommerce_app/features/home/data/models/category_detials_model.dart';
import 'package:ecommerce_app/features/home/data/models/home_model.dart';
import 'package:ecommerce_app/features/home/domain/usecases/get_category_details_usecase.dart';

abstract class HomeBaseRemoteDataSource {
  Future<HomeModel> getHomeData();
  Future<List<BannersModel>> getBanners();
  Future<List<CategoriesModel>> getCategories();
  Future<CategoryDetialsDataModel> getCategoryDetials(
      CatDetailsParams catDetailsParams);
}

class HomeRemoteDataSource implements HomeBaseRemoteDataSource {
  final DioHelper _dioHelper;

  HomeRemoteDataSource(this._dioHelper);

  @override
  Future<HomeModel> getHomeData() async {
    final response = await _dioHelper.getData(
      path: HOME,
      token: AppConstants.token,
    );
    // AppConstants.printFullText('responnnnnse ${response.data}');
    if (response.statusCode == 200 && response.data['status']) {
      return HomeModel.fromJson(response.data);
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<BannersModel>> getBanners() async {
    final response = await _dioHelper.getData(path: BANNARS);

    if (response.statusCode == 200 && response.data['status'] == true) {
      return List<BannersModel>.from(
          (response.data['data']).map((e) => BannersModel.fromJson(e)));
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<CategoriesModel>> getCategories() async {
    final response = await _dioHelper.getData(path: CATEGORIES);
    // AppConstants.printFullText(response.toString());
    if (response.statusCode == 200 && response.data['status'] == true) {
      return List<CategoriesModel>.from((response.data['data']['data'] as List)
          .map((e) => CategoriesModel.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<CategoryDetialsDataModel> getCategoryDetials(
      CatDetailsParams catDetailsParams) async {
    final response = await _dioHelper.getData(
      path: ApiConstance.getCategoryDetialsPath(
          categoryId: catDetailsParams.categoryId),
      token: AppConstants.token,
    );
    // AppConstants.printFullText(
    //     'response = ${CategoryDetialsDataModel.fromJson(response.data['data'])}');
    if (response.statusCode == 200 && response.data['status'] == true) {
      return CategoryDetialsDataModel.fromJson(response.data['data']);
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
