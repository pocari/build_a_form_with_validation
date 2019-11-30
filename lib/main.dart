import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hello, world',
      home: Scaffold(
        appBar: AppBar(
          title: Text('hello, world'),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyCustomFormState();
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              validator: (v) {
                if (v.isEmpty) {
                  return '名前を入力して下さい';
                }
                return null;
              },
            ),
            TextFormField(
              validator: (v) {
                if (v.isEmpty) {
                  return 'メールアドレスを入力して下さい';
                }
                return null;
              },
            )
          ],
        ),
      ),
      floatingActionButton: RaisedButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Processing Data')));
          }
        },
        child: Text('Submit'),
      ),
    );
  }
}
