import 'package:ecommerce_app/features/home/domain/entities/product_entity.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.name,
    required super.description,
    required super.inFavorites,
    required super.inCart,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        price: json['price'].toDouble(),
        oldPrice: json['old_price'].toDouble(),
        discount: json['discount'].toDouble(),
        image: json['image'],
        name: json['name'],
        description: json['description'],
        inFavorites: json['in_favorites'],
        inCart: json['in_cart'],
      );
}
