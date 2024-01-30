import 'package:ecommerce_app/features/authentication/data/models/user_data_model.dart';
import 'package:ecommerce_app/features/authentication/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({required super.status, required super.message, super.data});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json['status'],
        message: json['message'],
        data:
            json['data'] != null ? UserDataModel.fromJson(json['data']) : null,
      );
}
