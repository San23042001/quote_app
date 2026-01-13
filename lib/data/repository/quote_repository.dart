import 'package:quote_app/domain/entities/quote.dart';

abstract class QuoteRepository {
  Future<Quote> getRandomQuote();
  Future<void> saveFavorite(Quote quote);
  Future<void> removeFavorite(String id);
  Future<List<Quote>> getFavorites();
}
