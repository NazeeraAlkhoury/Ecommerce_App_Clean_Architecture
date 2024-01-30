import 'package:ecommerce_app/features/authentication/domain/usecases/register_usecase.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterUserEvent extends RegisterEvent {
  final RegisterParams registerParams;

  const RegisterUserEvent(this.registerParams);

  @override
  List<Object?> get props => [registerParams];
}

class ChangePassEvent extends RegisterEvent {
  const ChangePassEvent();

  @override
  List<Object?> get props => [];
}
