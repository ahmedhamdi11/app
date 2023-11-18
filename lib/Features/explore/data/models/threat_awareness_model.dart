class ThreatAwarenessModel {
  final String title;
  final String desc;
  final String imageUrl;

  const ThreatAwarenessModel({
    required this.title,
    required this.desc,
    required this.imageUrl,
  });

  factory ThreatAwarenessModel.fromJson(Map<String, dynamic> jsonData) {
    return ThreatAwarenessModel(
      title: jsonData['title'],
      desc: jsonData['desc'],
      imageUrl: jsonData['image'],
    );
  }
}
