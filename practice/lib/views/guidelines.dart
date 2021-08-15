import 'package:flutter/material.dart';

class Guidelines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(title: Text('Guidelines')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go Go Go'),
          onPressed: () {},
        ),
      ),
    );
  }
}
