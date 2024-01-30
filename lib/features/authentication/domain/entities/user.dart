import 'package:ecommerce_app/features/authentication/domain/entities/user_data.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final bool status;
  final String message;
  final UserData? data;

  const User({required this.status, required this.message, this.data});

  @override
  List<Object?> get props => [status, message, data];
}
