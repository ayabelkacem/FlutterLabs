import 'package:flutter/material.dart';
import 'quote_screen.dart';

class IntroScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Show Quotes'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => QuoteScreen()),
            );
          },
        ),
      ),
    );
  }
}
