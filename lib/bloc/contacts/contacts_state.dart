import 'package:abhinash_trexis/model/contacts_model.dart';

// States
abstract class ContactsState {}

class ContactsInitialState extends ContactsState {}

class ContactsLoadingState extends ContactsState {}

class ContactsLoadedState extends ContactsState {
  final List<Contact>? contacts;

  ContactsLoadedState(this.contacts);
}

class ContactsErrorState extends ContactsState {
  final String error;

  ContactsErrorState(this.error);
}
