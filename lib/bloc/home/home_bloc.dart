import 'dart:convert';
import 'package:abhinash_trexis/bloc/home/home_state.dart';
import 'package:abhinash_trexis/model/home_model.dart';
import 'package:abhinash_trexis/network/call_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Cubit<HomeState> {
  final GraphQLRepository repository;

  HomeBloc(this.repository) : super(HomeInitialState());

  void getHometDetails() async {
    emit(HomeLoadingState());
    try {
      final result = await repository.fetchFromApi(r'''
 query getHome {
  home {
    name
    accountNumber
    balance
    currency
    address {
      streetName
      buildingNumber
      townName
      postCode
      country
    }
    recentTransactions {
      date
      description
      amount
      fromAccount
      toAccount
    }
    upcomingBills {
      date
      description
      amount
      fromAccount
      toAccount
    }
  }
}
    ''');

      if (result.hasException) {
        emit(HomeErrorState(result.exception.toString()));
      } else {
        if (result.data!['home'] != null) {
          Home homeData = homeMapFrom(jsonEncode(result.data!['home']));

          emit(HomeLoadedState(homeData));
        } else {
          emit(HomeErrorState('Error getting data.'));
        }
      }
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }
}
