import 'package:injectable/injectable.dart';
import 'package:quote_app/data/datasource/local_datasource/quote_local_data_source.dart';
import 'package:quote_app/data/datasource/remote_datasource/quote_remote_datasource.dart';
import 'package:quote_app/data/repository/quote_repository.dart';
import 'package:quote_app/domain/entities/quote.dart';

@LazySingleton(as: QuoteRepository)
class QuoteRepositoryImpl implements QuoteRepository {
  final QuoteRemoteDataSource remoteDataSource;
  final QuoteLocalDataSource localDataSource;

  QuoteRepositoryImpl(this.remoteDataSource,this.localDataSource);

  @override
  Future<Quote> getRandomQuote() async {
    final model = await remoteDataSource.getRandomQuote();
    return model.toEntity();
  }

  @override
  Future<List<Quote>> getFavorites() {
   return localDataSource.getFavorites();
  }

  @override
  Future<void> removeFavorite(String id) {
   return localDataSource.removeFavorite(id);
  }

  @override
  Future<void> saveFavorite(Quote quote) {
     return localDataSource.saveFavorite(quote);
  }
}
