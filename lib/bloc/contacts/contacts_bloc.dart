import 'package:abhinash_trexis/bloc/contacts/contacts_state.dart';
import 'package:abhinash_trexis/model/contacts_model.dart';
import 'package:abhinash_trexis/network/call_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsBloc extends Cubit<ContactsState> {
  final GraphQLRepository repository;

  ContactsBloc(this.repository) : super(ContactsInitialState());

  void getContactstDetails() async {
    emit(ContactsLoadingState());
    try {
      final result = await repository.fetchFromApi(r'''
query getContacts {
  contacts 
}
    ''');

      if (result.hasException) {
        emit(ContactsErrorState(result.exception.toString()));
      } else {
        if (result.data!['contacts'] != null) {
          List<Contact> contactssData =
              contactMapFrom(result.data!['contacts']);
          emit(ContactsLoadedState(contactssData));
        } else {
          emit(ContactsErrorState('Error getting contacts.'));
        }
      }
    } catch (e) {
      emit(ContactsErrorState(e.toString()));
    }
  }
}
