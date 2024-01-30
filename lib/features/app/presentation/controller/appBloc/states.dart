import 'package:ecommerce_app/core/utils/app_enums.dart';
import 'package:equatable/equatable.dart';

class AppStates extends Equatable {
  final int currentIndex;
  final RequestState changeNaveState;

  const AppStates({
    this.currentIndex = 0,
    this.changeNaveState = RequestState.initializing,
  });

  AppStates copyWith({int? currentIndex, RequestState? changeNaveState}) =>
      AppStates(
        currentIndex: currentIndex ?? this.currentIndex,
        changeNaveState: changeNaveState ?? this.changeNaveState,
      );

  @override
  List<Object?> get props => [
        currentIndex,
        changeNaveState,
      ];
}
