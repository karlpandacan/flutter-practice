import 'package:flutter/material.dart';

class Announcement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(title: Text('Announcements')),
      body: Center(
        child: ElevatedButton(
          child: Text('Announcement Go'),
          onPressed: () {

          },
        ),
      ),
    );
  }
}
