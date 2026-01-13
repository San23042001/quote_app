import 'package:quote_app/domain/entities/quote.dart';

abstract class FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<Quote> quotes;
  FavoritesLoaded(this.quotes);
}

class FavoritesEmpty extends FavoritesState {}

class FavoritesError extends FavoritesState {
  final String message;
  FavoritesError(this.message);
}