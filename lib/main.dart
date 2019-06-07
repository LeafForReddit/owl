import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(new OwlApp());

class OwlApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    permCheck();
    return new MaterialApp(
      title: 'OWL',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Home(title: 'OWL'),
    );
  }

  void permCheck() async {
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.sms);
    if (permission != PermissionStatus.granted) {
      Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.sms]);
    }
  }
}

class Home extends StatelessWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('OWL'),
      ),
      body: new Center(
        child: new ListView(
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
