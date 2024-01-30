import 'package:ecommerce_app/features/home/domain/entities/bannares_entity.dart';
import 'package:ecommerce_app/features/home/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class HomeData extends Equatable {
  final List<Product> products;
  final List<Banners>? banners;

  const HomeData({required this.banners, required this.products});

  @override
  List<Object?> get props => [
        products,
        banners,
      ];
}
