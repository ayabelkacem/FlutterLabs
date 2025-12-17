import 'package:flutter_bloc/flutter_bloc.dart';
import 'quote_event.dart';
import 'quote_state.dart';
import '../repositories/quote_repository.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final QuoteRepository repository;

  QuoteBloc(this.repository) : super(QuoteInitial()) {
    on<LoadQuotes>((event, emit) async {
      emit(QuoteLoading());
      try {
        final quotes = await repository.getQuotes();
        emit(QuoteLoaded(quotes));
      } catch (_) {
        emit(QuoteError());
      }
    });
  }
}
