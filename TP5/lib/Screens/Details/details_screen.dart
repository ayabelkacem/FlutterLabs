import 'package:flutter/material.dart';
import '../../Models/book.dart';

class DetailsScreen extends StatefulWidget {
  final Book book;
  const DetailsScreen({Key? key, required this.book}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int quantity = 10;

  void _purchase() {
    if (quantity > 0) {
      setState(() => quantity--);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Purchased 1 — remaining: $quantity')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Out of stock')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.book.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.book.image,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(widget.book.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text("${widget.book.price} TND",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Lorem ipsum dolor sit amet consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton.icon(
              onPressed: _purchase,
              icon: const Icon(Icons.shopping_bag),
              label: const Text("Purchase"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Center(
              child: Text('Stock remaining: $quantity',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}