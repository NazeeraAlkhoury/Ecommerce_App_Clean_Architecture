import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String messageFailure;

  const Failure(this.messageFailure);

  @override
  List<Object?> get props => [messageFailure];
}

class ServerFailure extends Failure {
  const ServerFailure(super.messageFailure);
}
