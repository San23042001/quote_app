import 'package:flutter/material.dart';
import 'package:quote_app/core/app_color.dart';

class QuoteErrorWidget extends StatelessWidget {
  final String message;

  const QuoteErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 16,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Icon
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.gradientBottom.withOpacity(0.6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Icon(
                Icons.sentiment_dissatisfied_outlined,
                size: 36,
                color: AppColors.primaryText,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Friendly title
          const Text(
            'Oops!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryText,
            ),
          ),

          const SizedBox(height: 8),

          // Error message
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              height: 1.4,
              color: AppColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}
