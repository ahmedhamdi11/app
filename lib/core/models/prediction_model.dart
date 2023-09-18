class PredictionModel {
  final String prediction;
  final String predictionAccuracy;

  PredictionModel({
    required this.prediction,
    required this.predictionAccuracy,
  });

  factory PredictionModel.fromJson(Map<String, dynamic> jsonData) {
    return PredictionModel(
      prediction: jsonData['prediction'],
      predictionAccuracy: jsonData['prediction_accuracy'],
    );
  }
}
