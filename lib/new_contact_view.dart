import 'package:flutter/material.dart';
import 'package:vanillacontacts/contact.dart';
import 'package:vanillacontacts/contact_book.dart';

class NewContactView extends StatefulWidget {
  const NewContactView({Key? key}) : super(key: key);

  @override
  State<NewContactView> createState() => _NewContactViewState();
}

class _NewContactViewState extends State<NewContactView> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new Contact'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(
                hintText: "Enter a new Contact name here..."),
          ),
          TextButton(
              onPressed: () {
                final contact = Contact(_textEditingController.text);
                ContactBook().add(contact: contact);
                Navigator.of(context).pop();
              },
              child: const Text("Add"))
        ],
      ),
    );
  }
}
