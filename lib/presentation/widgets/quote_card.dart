import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  final String quote;
  final String author;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final VoidCallback onShareTap;

  const QuoteCard({
    super.key,
    required this.quote,
    required this.author,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.onShareTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFFFE8D6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Text(
                '“ ”',
                style: TextStyle(fontSize: 60, color: Colors.orange),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '"$quote"',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '– $author',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.orange : Colors.grey,
                ),
                onPressed: onFavoriteTap,
              ),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: onShareTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
