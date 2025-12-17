import 'package:flutter/material.dart';
import '../../Models/book.dart';

class LibraryCell extends StatelessWidget {
  final Book book;
  const LibraryCell({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  book.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              book.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text("${book.price} TND",
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}