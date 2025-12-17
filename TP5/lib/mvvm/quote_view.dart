import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/quote_bloc.dart';
import '../bloc/quote_state.dart';

class QuoteView extends StatelessWidget {
  const QuoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLoC Quotes')),
      body: BlocBuilder<QuoteBloc, QuoteState>(
        builder: (context, state) {
          if (state is QuoteLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is QuoteLoaded) {
            return ListView.builder(
              itemCount: state.quotes.length,
              itemBuilder: (_, i) => ListTile(
                title: Text(state.quotes[i].text),
                subtitle: Text(state.quotes[i].author),
              ),
            );
          } else {
            return const Text('Error');
          }
        },
      ),
    );
  }
}
