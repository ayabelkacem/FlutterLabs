import '../models/quote.dart';

abstract class QuoteState {}

class QuoteInitial extends QuoteState {}

class QuoteLoading extends QuoteState {}

class QuoteLoaded extends QuoteState {
  final List<Quote> quotes;
  QuoteLoaded(this.quotes);
}

class QuoteError extends QuoteState {}
