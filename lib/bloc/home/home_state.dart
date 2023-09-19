import 'package:abhinash_trexis/model/home_model.dart';

// States
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final Home home;

  HomeLoadedState(this.home);
}

class HomeErrorState extends HomeState {
  final String error;

  HomeErrorState(this.error);
}
