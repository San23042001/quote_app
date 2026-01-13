import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class QuoteShimmerCard extends StatelessWidget {
  const QuoteShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            // Top quote icon container
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            const SizedBox(height: 20),

            // Quote lines
            Container(
              height: 18,
              width: double.infinity,
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: 10),
            Container(
              height: 18,
              width: MediaQuery.of(context).size.width * 0.7,
              color: Colors.grey.shade300,
            ),

            const SizedBox(height: 16),

            // Author
            Container(
              height: 14,
              width: 120,
              color: Colors.grey.shade300,
            ),

            const SizedBox(height: 20),

            // Action icons placeholders
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 24,
                  width: 24,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(width: 16),
                Container(
                  height: 24,
                  width: 24,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
