import 'package:abhinash_trexis/bloc/contacts/contacts_bloc.dart';
import 'package:abhinash_trexis/bloc/contacts/contacts_state.dart';
import 'package:abhinash_trexis/config/colors.dart';
import 'package:abhinash_trexis/model/contacts_model.dart';

import 'package:abhinash_trexis/utils/space_widget.dart';
import 'package:abhinash_trexis/widgets/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ContactsBloc>(context).getContactstDetails();
  }

  List<int> yearsList = List.generate(5, (index) => 2023 - index);
  int? selectedYear;
  List<Contact> contacts = [];

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
                      'Contacts',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Expanded(
                  child: BlocBuilder<ContactsBloc, ContactsState>(
                    builder: (context, state) {
                      if (state is ContactsInitialState ||
                          state is ContactsLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is ContactsErrorState) {
                        return Center(
                            child: errorWidget('Error getting contacts.'));
                      } else if (state is ContactsLoadedState) {
                        // Contacts = state.Contacts!;

                        return contactsListMethod(state.contacts!);
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

  Widget contactsListMethod(List<Contact> contacts) => const Text('Contacts');
}
