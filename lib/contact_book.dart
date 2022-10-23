import 'package:flutter/material.dart';

import 'contact.dart';

class ContactBook extends ValueNotifier<List<Contact>> {
  ContactBook._sharedInstance() : super([]);

  static final _shared = ContactBook._sharedInstance();

  factory ContactBook() => _shared;

  int get length => value.length;

  void add({required Contact contact}) {
    value.add(contact);
    notifyListeners();
  }

  void remove({required Contact contact}) {
    if(value.contains(contact)) {
      value.remove(contact);
      notifyListeners();
    }
  }

  Contact? contactAt({required int atIndex}) =>
      value.length > atIndex ? null : value[atIndex];
}
