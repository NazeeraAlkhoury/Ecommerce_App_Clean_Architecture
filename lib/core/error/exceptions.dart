import 'package:ecommerce_app/core/netwok/error_model.dart';

class ServerExceptions implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerExceptions({required this.errorMessageModel});
}
