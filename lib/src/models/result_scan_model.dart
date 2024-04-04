class ResultScanModel {
  final String name;
  final String city;
  final String kodepan;

  const ResultScanModel({
    required this.name,
    required this.city,
    required this.kodepan,
  });

  factory ResultScanModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'kodepan': String kodepan,
        'name': String name,
        'city': String city,
      } =>
        ResultScanModel(
          kodepan: kodepan,
          name: name,
          city: city,
        ),
      _ => throw const FormatException('Failed to load information.'),
    };
  }
}
