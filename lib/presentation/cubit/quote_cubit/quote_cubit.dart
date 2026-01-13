import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quote_app/data/repository/quote_repository.dart';
import 'package:quote_app/domain/entities/quote.dart';
import 'package:quote_app/presentation/cubit/quote_cubit/quote_state.dart';

@injectable
class QuoteCubit extends Cubit<QuoteState> {
  final QuoteRepository repository;

  QuoteCubit(this.repository) : super(QuoteInitial());

  Future<void> fetchRandomQuote() async {
    emit(QuoteLoading());
    try {
      final Quote quote = await repository.getRandomQuote();

      emit(QuoteLoaded(quote));
    } catch (e) {
      emit(QuoteError(e.toString()));
    }
  }

  Future<void> toggleFavorite() async {
    if (state is QuoteLoaded) {
      final quote = (state as QuoteLoaded).quote;

      if (quote.isFavorite) {
        await repository.removeFavorite(quote.id);
      } else {
        await repository.saveFavorite(quote);
      }

      emit(QuoteLoaded(quote.copyWith(isFavorite: !quote.isFavorite)));
    }
  }
}
