class Quote {
  final String id;
  final String content;
  final String author;
  final bool isFavorite;

  Quote({
    required this.id,
    required this.content,
    required this.author,
    this.isFavorite = false,
  });

  Quote copyWith({bool? isFavorite}) {
    return Quote(
      id: id,
      content: content,
      author: author,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'],
      content: json['content'],
      author: json['author'],
      isFavorite: true, // favorites are always true
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'author': author,
    };
  }
}
