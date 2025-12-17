import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../Models/quote.dart';
import '../services/quote_api.dart';

class QuoteScreen extends StatelessWidget {
  final QuoteApi api = QuoteApi(Dio());
  
  // Mock data to avoid CORS issues on web
  Future<List<Quote>> _getQuotes() async {
    try {
      return await api.getQuotes();
    } catch (e) {
      // Return mock data if API fails (CORS issue on web)
      return [
        Quote(text: 'The only way to do great work is to love what you do.', author: 'Steve Jobs'),
        Quote(text: 'Innovation distinguishes between a leader and a follower.', author: 'Steve Jobs'),
        Quote(text: 'Life is what happens when you\'re busy making other plans.', author: 'John Lennon'),
        Quote(text: 'The future belongs to those who believe in the beauty of their dreams.', author: 'Eleanor Roosevelt'),
        Quote(text: 'It is during our darkest moments that we must focus to see the light.', author: 'Aristotle'),
      ];
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quotes')),
      body: FutureBuilder<List<Quote>>(
        future: _getQuotes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final quote = snapshot.data![index];
                return ListTile(
                  title: Text(quote.text),
                  subtitle: Text(quote.author),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
