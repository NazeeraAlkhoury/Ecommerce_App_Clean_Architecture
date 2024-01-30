import 'package:ecommerce_app/features/home/data/models/products_model.dart';
import 'package:ecommerce_app/features/home/domain/entities/category_detials_entity.dart';

class CategoryDetialsDataModel extends CategoryDetailsData {
  const CategoryDetialsDataModel({
    required super.data,
    required super.total,
  });
  factory CategoryDetialsDataModel.fromJson(Map<String, dynamic> json) =>
      CategoryDetialsDataModel(
        data: List<ProductModel>.from(
          (json['data'] as List).map(
            (e) => ProductModel.fromJson(e),
          ),
        ),
        total: json['total'],
      );
}
