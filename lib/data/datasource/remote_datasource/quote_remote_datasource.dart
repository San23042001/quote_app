import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quote_app/core/network/api_constants.dart';
import 'package:quote_app/core/network/network_exception.dart';
import 'package:quote_app/data/models/quote_model.dart';

abstract class QuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

@LazySingleton(as: QuoteRemoteDataSource)
class QuoteRemoteDataSourceImpl implements QuoteRemoteDataSource {
  final Dio dio;

  QuoteRemoteDataSourceImpl(this.dio);

  @override
  Future<QuoteModel> getRandomQuote() async {
    try {
      final response = await dio.get(ApiConstants.randomQuote);

      final List data = response.data;
      return QuoteModel.fromJson(data.first);
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    }
  }
}
