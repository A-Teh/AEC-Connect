

List<int>? metricsAppendRating(
  List<int>? history,
  double? rating,
) {
  final updated = List<int>.from(history ?? <int>[]);
  if (rating != null) updated.add(rating.round());
  return updated;
}
