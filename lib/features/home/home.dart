import 'package:abhinash_trexis/bloc/home/home_bloc.dart';
import 'package:abhinash_trexis/bloc/home/home_state.dart';
import 'package:abhinash_trexis/config/colors.dart';
import 'package:abhinash_trexis/config/temp_data.dart';
import 'package:abhinash_trexis/features/home/account_info.dart';
import 'package:abhinash_trexis/features/home/address_view.dart';
import 'package:abhinash_trexis/features/home/recent_transactions.dart';
import 'package:abhinash_trexis/features/home/upcoming_bills.dart';
import 'package:abhinash_trexis/model/home_model.dart';
import 'package:abhinash_trexis/utils/space_widget.dart';
import 'package:abhinash_trexis/widgets/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    //This bloc function calls home api
    BlocProvider.of<HomeBloc>(context).getHometDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              if (state is HomeInitialState || state is HomeLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeErrorState) {
                //'Error getting home.'
                return Center(
                    child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<HomeBloc>(context).getHometDetails();
                        },
                        child: errorWidget('Error getting home.')));
              } else if (state is HomeLoadedState) {
                Home homeData = state.home;
                Address? address = state.home.address;
                List<RecentTransaction>? recentTrans =
                    state.home.recentTransactions;
                List<RecentTransaction>? upcoming = state.home.upcomingBills;
                return ListView(
                  children: [
                    addHeight(24),

                    //addHeight(16),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Text(
                        'Hello, ${homeData.name}',
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Logged in as ${trexis.getUserName}',
                        maxLines: 1,
                        style: const TextStyle(
                            color: AppColors.text,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    addHeight(16),
                    //Account Info Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: myAccountInfoCard(homeData),
                    ),
                    addHeight(16),

                    //Address View Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: myAddressViewCard(address),
                    ),
                    addHeight(16),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Recent Transactions',
                          style: TextStyle(
                              color: AppColors.lable,
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
                    ),
                    addHeight(8),

                    //Recent Transactions Info Card
                    myRecentTransactionsCard(recentTrans),
                    addHeight(16),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Upcoming Bills',
                          style: TextStyle(
                              color: AppColors.lable,
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
                    ),
                    addHeight(8),

                    //Upcoming bills  Card
                    myUpcomingBillsCard(upcoming),
                    addHeight(16)
                  ],
                );
              } else {
                return const Center(child: Text('Unknown State'));
              }
            })),
      ),
    );
  }

  //Account info method
  Widget myAccountInfoCard(Home home) => MyAccountInfo(home: home);

  //Address info method
  Widget myAddressViewCard(Address? address) =>
      AddressViewCard(address: address);

  //Recent Transactions method
  Widget myRecentTransactionsCard(List<RecentTransaction>? recentTransaction) =>
      RecentTransactionsPage(recentTransaction: recentTransaction);

  //Upcoming bills method
  Widget myUpcomingBillsCard(List<RecentTransaction>? upcoming) =>
      UpComingBillsPage(
        upcoming: upcoming,
      );
}
