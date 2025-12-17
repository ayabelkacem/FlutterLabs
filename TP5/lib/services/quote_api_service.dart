import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quote.dart';

class QuoteApiService {
  Future<List<Quote>> fetchQuotes() async {
    final response =
        await http.get(Uri.parse('https://zenquotes.io/api/quotes'));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => Quote.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load quotes');
    }
  }
}
