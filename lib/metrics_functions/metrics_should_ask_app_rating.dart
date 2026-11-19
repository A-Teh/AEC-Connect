

bool? metricsShouldAskAppRating(
  int? timesAuthenticated,
  int? lastAsked,
) {
  if (timesAuthenticated == null || timesAuthenticated <= 0) return false;
  return timesAuthenticated % 10 == 0 && timesAuthenticated != lastAsked;
}
