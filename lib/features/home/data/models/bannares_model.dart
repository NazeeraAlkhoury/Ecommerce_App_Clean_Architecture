import 'package:ecommerce_app/features/home/domain/entities/bannares_entity.dart';

class BannersModel extends Banners {
  const BannersModel({
    required super.id,
    required super.image,
  });

  factory BannersModel.fromJson(Map<String, dynamic> json) => BannersModel(
        id: json['id'],
        image: json['image'],
      );
}
