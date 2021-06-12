import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Location'),
          backgroundColor: Colors.blue[600],
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            FlatButton.icon(
              onPressed: () {
                setState(() {
                  counter += 1;
                });
              },
              icon: Icon(Icons.edit),
              label: Text('Choose location'),
            ),
            Text('Counter is $counter')
          ],
        ));
  }
}
