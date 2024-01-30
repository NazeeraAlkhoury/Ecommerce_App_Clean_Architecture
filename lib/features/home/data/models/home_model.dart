import 'package:ecommerce_app/features/home/data/models/home_data_model.dart';
import 'package:ecommerce_app/features/home/domain/entities/home_entity.dart';

class HomeModel extends Home {
  const HomeModel({required super.status, required super.data});
  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json['status'],
        data: HomeDataModel.fromJson(json['data']),
      );
}
