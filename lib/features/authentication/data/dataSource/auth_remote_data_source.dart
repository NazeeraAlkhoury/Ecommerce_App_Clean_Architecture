// ignore_for_file: avoid_print

import 'package:ecommerce_app/core/error/exceptions.dart';
import 'package:ecommerce_app/core/netwok/error_model.dart';

import 'package:ecommerce_app/core/utils/app_constants.dart';
import 'package:ecommerce_app/core/utils/dio_helper.dart';
import 'package:ecommerce_app/features/authentication/data/models/user_model.dart';
import 'package:ecommerce_app/features/authentication/domain/usecases/register_usecase.dart';

abstract class AuthBaseRemoteDataSource {
  Future<UserModel> logInUser(
    String email,
    String password,
  );
  Future<UserModel> registerUser(RegisterParams registerParams);
}

class AuthRemoteDataSource implements AuthBaseRemoteDataSource {
  // final Dio dio;

  // AuthRemoteDataSource(this.dio);
  // Dio dio = sl<Dio>();
  final DioHelper _dioHelper;

  AuthRemoteDataSource(this._dioHelper);
  @override
  Future<UserModel> logInUser(String email, String password) async {
    final response = await _dioHelper.postData(path: 'login', data: {
      'email': email,
      'password': password,
    });
    AppConstants.printFullText(response.data.toString());

    if (response.data['status'] == true) {
      return UserModel.fromJson(response.data);
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<UserModel> registerUser(RegisterParams registerParams) async {
    final response = await _dioHelper.postData(
      path: 'register',
      data: {
        'name': registerParams.name,
        'phone': registerParams.phone,
        'email': registerParams.email,
        'password': registerParams.password,
      },
    );
    if (response.data['status'] == true) {
      return UserModel.fromJson(response.data);
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
