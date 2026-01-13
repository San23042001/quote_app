import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app/get_it/injectable.dart';
import 'package:quote_app/presentation/cubit/favourite_cubit/favourite_cubit.dart';
import 'package:quote_app/presentation/cubit/favourite_cubit/favourite_state.dart';
import 'package:quote_app/presentation/widgets/favourite_quote_card.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: BlocProvider(
        create: (context) =>getIt<FavoritesCubit>()..loadFavorites(),
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is FavoritesEmpty) {
              return const Center(child: Text('No favorites yet'));
            }

            if (state is FavoritesLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: state.quotes.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final quote = state.quotes[index];
                  return FavoriteQuoteCard(quote: quote);
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
