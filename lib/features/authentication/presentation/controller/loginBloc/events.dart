import 'package:equatable/equatable.dart';

abstract class LogInEvent extends Equatable {
  const LogInEvent();
}

class LogInUserEvent extends LogInEvent {
  final String email;
  final String password;

  const LogInUserEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class ChangePassEvent extends LogInEvent {
  const ChangePassEvent();

  @override
  List<Object?> get props => [];
}
