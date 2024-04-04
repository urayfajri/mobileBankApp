class ResultScan {
  final String name;
  final String city;
  final String kodepan;

  const ResultScan({
    required this.name,
    required this.city,
    required this.kodepan,
  });

  factory ResultScan.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'kodepan': String kodepan,
        'name': String name,
        'city': String city,
      } =>
        ResultScan(
          kodepan: kodepan,
          name: name,
          city: city,
        ),
      _ => throw const FormatException('Failed to load information.'),
    };
  }
}
