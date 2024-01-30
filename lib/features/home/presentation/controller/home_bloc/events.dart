import 'package:equatable/equatable.dart';

abstract class HomeEvents extends Equatable {
  const HomeEvents();
}

class GetHomeEvent extends HomeEvents {
  @override
  List<Object?> get props => [];
}

// class GetBannersEvent extends HomeEvents {
//   // const GetBannersEvent();
//   @override
//   List<Object?> get props => [];
// }

class GetCategoriesEvent extends HomeEvents {
  @override
  List<Object?> get props => [];
}

class GetCatDetailsEvent extends HomeEvents {
  final int catId;

  const GetCatDetailsEvent({required this.catId});

  @override
  List<Object?> get props => [catId];
}
