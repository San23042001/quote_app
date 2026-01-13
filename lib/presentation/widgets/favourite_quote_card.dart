import 'package:flutter/material.dart';
import 'package:quote_app/domain/entities/quote.dart';
import 'package:quote_app/utils/share_helper.dart';

class FavoriteQuoteCard extends StatelessWidget {
  final Quote quote;

  const FavoriteQuoteCard({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.format_quote),
              Icon(Icons.favorite, color: Colors.orange),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '"${quote.content}"',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text('– ${quote.author}', style: const TextStyle(fontSize: 12)),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                ShareHelper.shareQuote(
                  quote: quote.content,
                  author: quote.author,
                );
              },
              child: Text(
                'SHARE',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
