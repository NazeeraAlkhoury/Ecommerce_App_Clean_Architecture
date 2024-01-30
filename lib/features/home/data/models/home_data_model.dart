import 'package:ecommerce_app/features/home/data/models/bannares_model.dart';
import 'package:ecommerce_app/features/home/data/models/products_model.dart';
import 'package:ecommerce_app/features/home/domain/entities/home_data_entity.dart';

class HomeDataModel extends HomeData {
  const HomeDataModel({required super.products, required super.banners});
  factory HomeDataModel.fromJson(Map<String, dynamic> json) => HomeDataModel(
        products:
            // json['products'] != null
            //     ?
            List<ProductModel>.from(
          ((json['products'] as List).map(
            (e) => ProductModel.fromJson(e),
          )),
        ),
        // : null,
        banners: json['banners'] != null
            ? List<BannersModel>.from(
                (json['banners'] as List).map(
                  (e) => BannersModel.fromJson(e),
                ),
              )
            : null,
      );
}
