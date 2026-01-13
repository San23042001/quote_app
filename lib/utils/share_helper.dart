import 'package:share_plus/share_plus.dart';

class ShareHelper {
  static Future<void> shareQuote({
    required String quote,
    required String author,
  }) async {
    final text = '"$quote"\n— $author';
    await SharePlus.instance.share(ShareParams(text: text));
  }
}
