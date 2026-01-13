import '../../domain/entities/quote.dart';

class QuoteModel {
  final String content;
  final String author;

  QuoteModel({
    required this.content,
    required this.author,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      content: json['q'],
      author: json['a'],
    );
  }

  Quote toEntity() {
    return Quote(
      id: content.hashCode.toString(), // simple unique id
      content: content,
      author: author,
    );
  }
}
