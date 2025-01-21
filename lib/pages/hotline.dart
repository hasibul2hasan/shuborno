import 'package:flutter/material.dart';

class HotlinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotline'),
      ),
      body: Center(
        child: Text(
          'Hotline Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
