import 'package:intl/intl.dart';

class NewsModel {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;

  NewsModel({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  factory NewsModel.fromJson(Map<String, dynamic> jsonData) {
    String publishedAt = '';

    // formate date
    if (jsonData['publishedAt'] != null) {
      DateTime publishedAtDateTime = DateTime.parse(jsonData['publishedAt']);
      publishedAt =
          DateFormat('MMM d, At h:mm a').format(publishedAtDateTime).toString();
    }

    // return the model data
    return NewsModel(
      title: jsonData['title'] ?? '',
      description: jsonData['description'] ?? 'No description.',
      url: jsonData['url'] ?? '',
      urlToImage: jsonData['urlToImage'] ?? '',
      publishedAt: publishedAt,
    );
  }
}
