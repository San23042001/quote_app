import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:quote_app/domain/entities/quote.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class QuoteLocalDataSource {
  Future<List<Quote>> getFavorites();
  Future<void> saveFavorite(Quote quote);
  Future<void> removeFavorite(String id);
  Future<bool> isFavorite(String id);
}

@LazySingleton(as:  QuoteLocalDataSource)
class QuoteLocalDataSourceImpl implements QuoteLocalDataSource {
  static const _key = 'favorite_quotes';

  @override
  Future<List<Quote>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];

    return list
        .map((e) => Quote.fromJson(jsonDecode(e)))
        .toList();
  }

  @override
  Future<void> saveFavorite(Quote quote) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];

   list.add(jsonEncode(quote.toJson()));

    await prefs.setStringList(_key, list);
  }

  @override
  Future<void> removeFavorite(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];

    list.removeWhere((e) => jsonDecode(e)['id'] == id);
    await prefs.setStringList(_key, list);
  }

  @override
  Future<bool> isFavorite(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];

    return list.any((e) => jsonDecode(e)['id'] == id);
  }
}
