import 'package:quote_app/domain/entities/quote.dart';

abstract class QuoteState {}

class QuoteInitial extends QuoteState {}

class QuoteLoading extends QuoteState {}

class QuoteLoaded extends QuoteState {
  final Quote quote;
  QuoteLoaded(this.quote);
}

class QuoteError extends QuoteState {
  final String message;
  QuoteError(this.message);
}