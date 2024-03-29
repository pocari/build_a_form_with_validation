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
  final myController = TextEditingController();
  final myForcusNode = FocusNode();

  void _printLatestValue() {
    print("Second text field: ${myController.text}");
  }

  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    myController.dispose();
    myForcusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Name",
                hintText: 'Jane Doe',
              ),
              validator: (v) {
                if (v.isEmpty) {
                  return '名前を入力して下さい';
                }
                return null;
              },
              onChanged: (text) {
                print("onChanged: Name: $text");
              },
              controller: myController,
            ),
            TextFormField(
              autofocus: true,
              focusNode: myForcusNode,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'hoge@example.com',
                labelText: "Email",
              ),
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              }
            },
            child: Text('Submit'),
          ),
          FloatingActionButton(
            onPressed: () {
              return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(myController.text),
                    );
                  });
            },
            child: Icon(Icons.text_fields),
          ),
          RaisedButton(
            onPressed: () {
              FocusScope.of(context).requestFocus(myForcusNode);
            },
            child: Text("Email にforcus"),
          ),
        ],
      ),
    );
  }
}
