import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'mvvm/quote_view.dart';
import 'bloc/quote_bloc.dart';
import 'bloc/quote_event.dart';
import 'repositories/quote_repository.dart';
import 'services/quote_api_service.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => QuoteBloc(QuoteRepository(QuoteApiService()))
        ..add(LoadQuotes()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: QuoteView());
  }
}
