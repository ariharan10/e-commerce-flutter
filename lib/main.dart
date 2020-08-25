import 'package:flutter/material.dart';
import 'package:contact_picker/contact_picker.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ContactPicker _contactPicker = new ContactPicker();
  Contact _contact;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Contact Picke'),
        ),
        body: new Center(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FlatButton(
                onPressed: () async {
                  Contact contact = await _contactPicker.selectContact();
                  setState(() {
                    _contact = contact;
                  });
                },
                color: Colors.blue,
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[Icon(Icons.add), Text("Add a customer")],
                ),
              ),
              new Text(
                _contact == null ? 'No contact selected.' : _contact.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
