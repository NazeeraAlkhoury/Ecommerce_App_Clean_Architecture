import 'package:ecommerce_app/features/authentication/domain/entities/user_data.dart';

class UserDataModel extends UserData {
  const UserDataModel(
      {required super.id,
      required super.name,
      required super.email,
      required super.phone,
      required super.image,
      required super.points,
      required super.credit,
      required super.token});

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        image: json['image'],
        points: json['points'],
        credit: json['credit'],
        token: json['token'],
      );
}
