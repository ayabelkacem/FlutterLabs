import 'package:flutter/material.dart';
import '../../models/book.dart';
import 'home_cell.dart';
import '../../Screens/Details/details_screen.dart';
import '../../Screens/LibraryScreen/library_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final books = <Book>[
      Book("Madame Bovary", 35, 'assets/madame_bovary.jpg'),
      Book("L'Étranger", 28, 'assets/letranger.jpg'),
      Book("Le Petit Prince", 25, 'assets/petit_prince.jpg'),
      Book("Madame Bovary", 35, 'assets/madame_bovary.jpg'),
      Book("L'Étranger", 28, 'assets/letranger.jpg'),
      Book("Le Petit Prince", 25, 'assets/petit_prince.jpg'),
      Book("Madame Bovary", 35, 'assets/madame_bovary.jpg'),
      Book("L'Étranger", 28, 'assets/letranger.jpg'),
      Book("Le Petit Prince", 25, 'assets/petit_prince.jpg'),
      Book("Madame Bovary", 35, 'assets/madame_bovary.jpg'),
      Book("L'Étranger", 28, 'assets/letranger.jpg'),
      Book("Le Petit Prince", 25, 'assets/petit_prince.jpg'),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 107, 235),
        title: const Text(
          "Store INSAT",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.grid_view, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LibraryScreen(books: books),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final b = books[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailsScreen(book: b)),
              );
            },
            child: HomeCell(b),
          );
        },
      ),
    );
  }
}