class EmailDetectionModel {
  final String prediction;
  final String predictionAccuracy;

  EmailDetectionModel({
    required this.prediction,
    required this.predictionAccuracy,
  });

  factory EmailDetectionModel.fromJson(Map<String, dynamic> jsonData) {
    return EmailDetectionModel(
      prediction: jsonData['prediction'],
      predictionAccuracy: jsonData['prediction_accuracy'],
    );
  }
}
