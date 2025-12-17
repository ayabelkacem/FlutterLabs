import '../models/quote.dart';
import '../services/quote_api_service.dart';

class QuoteRepository {
  final QuoteApiService apiService;

  QuoteRepository(this.apiService);

  Future<List<Quote>> getQuotes() async {
    final quotes = await apiService.fetchQuotes();
    quotes.sort((a, b) => a.author.compareTo(b.author));
    return quotes.take(10).toList();
  }
}
