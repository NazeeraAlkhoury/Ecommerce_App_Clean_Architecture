import 'package:ecommerce_app/features/home/domain/entities/home_data_entity.dart';
import 'package:equatable/equatable.dart';

class Home extends Equatable {
  final bool status;
  final String? message;
  final HomeData data;

  const Home({required this.status, this.message, required this.data});

  @override
  List<Object?> get props => [
        status,
        message,
        data,
      ];
}
