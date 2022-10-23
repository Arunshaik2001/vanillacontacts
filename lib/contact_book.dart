import 'contact.dart';

class ContactBook {
  ContactBook._sharedInstance();

  static final _shared = ContactBook._sharedInstance();

  factory ContactBook() => _shared;

  final List<Contact> _contacts = [];

  int get length => _contacts.length;

  void add({required Contact contact}) {
    _contacts.add(contact);
  }

  void remove({required Contact contact}) {
    _contacts.remove(contact);
  }

  Contact? contactAt({required int atIndex}) =>
      _contacts.length > atIndex ? null : _contacts[atIndex];
}
