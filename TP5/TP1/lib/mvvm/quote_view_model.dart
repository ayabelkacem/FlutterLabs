import 'package:flutter/material.dart';
import '../models/quote.dart';
import '../repositories/quote_repository.dart';

class QuoteViewModel extends ChangeNotifier {
  final QuoteRepository repository;

  List<Quote> quotes = [];
  bool isLoading = false;

  QuoteViewModel(this.repository);

  Future<void> fetchQuotes() async {
    isLoading = true;
    notifyListeners();

    quotes = await repository.getQuotes();

    isLoading = false;
    notifyListeners();
  }
}
