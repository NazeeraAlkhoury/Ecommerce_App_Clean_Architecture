import 'package:equatable/equatable.dart';

abstract class AppEvents extends Equatable {
  const AppEvents();
}

class ChangeBottomNavBarEvent extends AppEvents {
  final int currentIndex;

  const ChangeBottomNavBarEvent(this.currentIndex);

  @override
  List<Object?> get props => [currentIndex];
}
