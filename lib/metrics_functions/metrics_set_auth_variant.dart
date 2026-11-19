// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_analytics/firebase_analytics.dart';

Future metricsSetAuthVariant(String? variant) async {
  if (variant == null || variant.isEmpty) return;
  await FirebaseAnalytics.instance
      .setUserProperty(name: 'auth_variant', value: variant);
}
