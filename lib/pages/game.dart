import 'package:flutter/material.dart';

class GamesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Games'),
      ),
      body: Center(
        child: Text(
          'Games',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
