import 'package:flutter/material.dart';
import 'package:vanillacontacts/contact_book.dart';
import 'package:vanillacontacts/new_contact_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      routes: {
        "/new-contact" : (context) => const NewContactView()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final contactBook = ContactBook();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            final contact = contactBook.contactAt(atIndex: index);
            return ListTile(
              title: Text(contact?.name ?? ''),
            );
          },
          itemCount: contactBook.length,
        ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async{
          await Navigator.of(context).pushNamed("/new-contact");
        },
      ),
    );
  }
}
