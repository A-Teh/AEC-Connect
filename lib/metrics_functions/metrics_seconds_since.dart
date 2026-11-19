

/// Computes the difference between two times and returns the result as an
/// integer.
///
/// ARGUMENTS
/// tsStart - The start time
/// tsNow - The current time (or, your second timestamp)
///
/// RETURNS
/// Seconds between two timestamps as an integer
int? metricsSecondsSince(
  DateTime? tsStart,
  DateTime? tsNow,
) {
  if (null == tsStart || null == tsNow) return 0;

  return tsNow.difference(tsStart).inSeconds;
}
