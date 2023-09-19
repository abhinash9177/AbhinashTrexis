import 'package:abhinash_trexis/bloc/statements/statements_bloc.dart';
import 'package:abhinash_trexis/bloc/statements/statements_state.dart';
import 'package:abhinash_trexis/config/colors.dart';
import 'package:abhinash_trexis/features/services/statements_show.dart';
import 'package:abhinash_trexis/model/statement_model.dart';
import 'package:abhinash_trexis/utils/space_widget.dart';
import 'package:abhinash_trexis/widgets/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class StatementsPage extends StatefulWidget {
  const StatementsPage({super.key});

  @override
  State<StatementsPage> createState() => _StatementsPageState();
}

class _StatementsPageState extends State<StatementsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<StatementsBloc>(context).getStatementstDetails();
  }

  List<int> yearsList = List.generate(5, (index) => 2023 - index);
  int? selectedYear;
  List<Statement> statements = [];
  List<Statement> statementsList = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addHeight(24),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: AppColors.black,
                        size: 20,
                      ),
                    ),
                    addWidth(16),
                    const Text(
                      'Statements',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    yearsDropDown(),
                    selectedYear == null
                        ? const SizedBox.shrink()
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedYear = null;
                                statements = statementsList;
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.close,
                                color: AppColors.primary,
                              ),
                            ),
                          )
                  ],
                ),
                Expanded(
                  child: BlocConsumer<StatementsBloc, StatementsState>(
                    listener: (context, state) {
                      if (state is StatementsLoadedState) {
                        setState(() {
                          statementsList = state.statements!;
                          statements = state.statements!;
                        });
                      }
                    },
                    builder: (context, state) {
                      if (state is StatementsInitialState ||
                          state is StatementsLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is StatementsErrorState) {
                        return Center(
                            child: errorWidget('Error getting Statements.'));
                      } else if (state is StatementsLoadedState) {
                        // statements = state.statements!;

                        return statementsListMethod(statements);
                      } else {
                        return const Center(child: Text('Unknown State'));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget statementsListMethod(List<Statement> statements) =>
      StatementsShowPage(statements: statements);

  Widget yearsDropDown() {
    return SizedBox(
      height: 30,
      width: 100,
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(left: 16),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary),
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary),
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary),
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          focusColor: AppColors.primary,

          //rfilled: true,
          iconColor: AppColors.black,
          hintStyle: TextStyle(color: Color(0xff92A0B3)),
          hintText: "Year",
        ),
        value: selectedYear,
        onChanged: (int? value) {
          setState(() {
            selectedYear = value!;
          });
          filterStatements(selectedYear!);
        },
        items: yearsList
            .map((year) => DropdownMenuItem(
                value: year,
                child: Text(
                  year.toString(),
                  style: const TextStyle(color: AppColors.black),
                )))
            .toList(),
      ),
    );
  }

  filterStatements(int fileterDate) {
    List<Statement> newList = statementsList.where((item) {
      List<String> dateParts = item.date!.split('-');

      if (dateParts.length == 3) {
        int itemYear = int.parse(dateParts[0]);

        return itemYear == fileterDate;
      }

      return false;
    }).toList();

    setState(() {
      statements = newList;
    });
  }
}
