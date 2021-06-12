import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
        appBar: AppBar(
          title: Text('World Time'),
          centerTitle: true,
          backgroundColor: Colors.blue[600],
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FlatButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/location');
                      },
                      icon: Icon(Icons.edit),
                      label: Text('Change Location'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '${data['location']}',
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2
                      ),
                    ),
                    SizedBox(height: 20),

                    Text(
                      '${data['time']}',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2
                      ),
                    ),
                    ],
                )
              ],
            ),
          ),
        ));
  }
}
