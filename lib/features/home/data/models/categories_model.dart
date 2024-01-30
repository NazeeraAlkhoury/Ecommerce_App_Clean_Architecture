import 'package:ecommerce_app/features/home/domain/entities/categories_entity.dart';

class CategoriesModel extends Categories {
  const CategoriesModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
      );
}
