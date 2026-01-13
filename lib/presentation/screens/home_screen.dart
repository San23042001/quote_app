import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app/core/app_color.dart';
import 'package:quote_app/presentation/cubit/quote_cubit/quote_cubit.dart';
import 'package:quote_app/presentation/cubit/quote_cubit/quote_state.dart';
import 'package:quote_app/presentation/widgets/new_quote_button.dart';
import 'package:quote_app/presentation/widgets/quote_card.dart';
import 'package:quote_app/presentation/widgets/quote_error_widget.dart';
import 'package:quote_app/presentation/widgets/quote_loader.dart';
import 'package:quote_app/utils/share_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Daily Quote'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.gradientTop,
                AppColors.gradientMiddle,
                AppColors.gradientBottom,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<QuoteCubit, QuoteState>(
                    builder: (context, state) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // 🔁 Swap only the card
                          if (state is QuoteLoading)
                            const QuoteShimmerCard()
                          else if (state is QuoteLoaded)
                            QuoteCard(
                              quote: state.quote.content,
                              author: state.quote.author,
                              isFavorite: state.quote.isFavorite,
                              onFavoriteTap: () {
                                context.read<QuoteCubit>().toggleFavorite();
                              },
                              onShareTap: () {
                                ShareHelper.shareQuote(
                                  quote: state.quote.content,
                                  author: state.quote.author,
                                );
                              },
                            )
                          else if (state is QuoteError)
                            QuoteErrorWidget(message: state.message),

                          const SizedBox(height: 24),

                          // Button always visible
                          NewQuoteButton(
                            onPressed: () {
                              context.read<QuoteCubit>().fetchRandomQuote();
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
