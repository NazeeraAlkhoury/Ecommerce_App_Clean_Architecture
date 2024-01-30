import 'package:ecommerce_app/features/home/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class CategoryDetailsData extends Equatable {
  final List<Product> data;
  final int total;

  const CategoryDetailsData({
    required this.data,
    required this.total,
  });

  @override
  List<Object?> get props => [
        data,
        total,
      ];
}
