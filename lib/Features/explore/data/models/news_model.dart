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
    return NewsModel(
      title: jsonData['title'] ?? '',
      description: jsonData['description'] ?? 'No description.',
      url: jsonData['url'] ?? '',
      urlToImage: jsonData['urlToImage'] ?? '',
      publishedAt: jsonData['publishedAt'],
    );
  }
}
