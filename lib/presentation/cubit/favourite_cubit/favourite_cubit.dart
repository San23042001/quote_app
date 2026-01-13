import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quote_app/data/repository/quote_repository.dart';
import 'package:quote_app/presentation/cubit/favourite_cubit/favourite_state.dart';

@injectable
class FavoritesCubit extends Cubit<FavoritesState> {
  final QuoteRepository repository;

  FavoritesCubit(this.repository) : super(FavoritesLoading());

  Future<void> loadFavorites() async {
    emit(FavoritesLoading());
    final quotes = await repository.getFavorites();

    if (quotes.isEmpty) {
      emit(FavoritesEmpty());
    } else {
      emit(FavoritesLoaded(quotes));
    }
  }
}
