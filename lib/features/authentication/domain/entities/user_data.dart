import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final int? points;
  final int? credit;
  final String token;

  const UserData(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.image,
      required this.points,
      required this.credit,
      required this.token});

  @override
  List<Object?> get props =>
      [id, name, email, phone, image, points, credit, token];
}
