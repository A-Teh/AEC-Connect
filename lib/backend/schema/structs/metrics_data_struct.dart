// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MetricsDataStruct extends FFFirebaseStruct {
  MetricsDataStruct({
    /// What version of the app the user signed up on
    String? sIGNINAuthVariant,
    int? sIGNINAuthEaseRating,
    bool? sIGNINRatingShown,
    int? timesAuthenticated,
    int? appRatingLatest,
    List<int>? appRatingHistory,
    int? appRatingLastAsked,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _sIGNINAuthVariant = sIGNINAuthVariant,
        _sIGNINAuthEaseRating = sIGNINAuthEaseRating,
        _sIGNINRatingShown = sIGNINRatingShown,
        _timesAuthenticated = timesAuthenticated,
        _appRatingLatest = appRatingLatest,
        _appRatingHistory = appRatingHistory,
        _appRatingLastAsked = appRatingLastAsked,
        super(firestoreUtilData);

  // "SIGN-IN_auth_variant" field.
  String? _sIGNINAuthVariant;
  String get sIGNINAuthVariant => _sIGNINAuthVariant ?? '';
  set sIGNINAuthVariant(String? val) => _sIGNINAuthVariant = val;

  bool hasSIGNINAuthVariant() => _sIGNINAuthVariant != null;

  // "SIGN-IN_auth_ease_rating" field.
  int? _sIGNINAuthEaseRating;
  int get sIGNINAuthEaseRating => _sIGNINAuthEaseRating ?? 0;
  set sIGNINAuthEaseRating(int? val) => _sIGNINAuthEaseRating = val;

  void incrementSIGNINAuthEaseRating(int amount) =>
      sIGNINAuthEaseRating = sIGNINAuthEaseRating + amount;

  bool hasSIGNINAuthEaseRating() => _sIGNINAuthEaseRating != null;

  // "SIGN-IN_rating_shown" field.
  bool? _sIGNINRatingShown;
  bool get sIGNINRatingShown => _sIGNINRatingShown ?? false;
  set sIGNINRatingShown(bool? val) => _sIGNINRatingShown = val;

  bool hasSIGNINRatingShown() => _sIGNINRatingShown != null;

  // "times_authenticated" field.
  int? _timesAuthenticated;
  int get timesAuthenticated => _timesAuthenticated ?? 0;
  set timesAuthenticated(int? val) => _timesAuthenticated = val;

  void incrementTimesAuthenticated(int amount) =>
      timesAuthenticated = timesAuthenticated + amount;

  bool hasTimesAuthenticated() => _timesAuthenticated != null;

  // "app_rating_latest" field.
  int? _appRatingLatest;
  int get appRatingLatest => _appRatingLatest ?? 0;
  set appRatingLatest(int? val) => _appRatingLatest = val;

  void incrementAppRatingLatest(int amount) =>
      appRatingLatest = appRatingLatest + amount;

  bool hasAppRatingLatest() => _appRatingLatest != null;

  // "app_rating_history" field.
  List<int>? _appRatingHistory;
  List<int> get appRatingHistory => _appRatingHistory ?? const [];
  set appRatingHistory(List<int>? val) => _appRatingHistory = val;

  void updateAppRatingHistory(Function(List<int>) updateFn) {
    updateFn(_appRatingHistory ??= []);
  }

  bool hasAppRatingHistory() => _appRatingHistory != null;

  // "app_rating_last_asked" field.
  int? _appRatingLastAsked;
  int get appRatingLastAsked => _appRatingLastAsked ?? 0;
  set appRatingLastAsked(int? val) => _appRatingLastAsked = val;

  void incrementAppRatingLastAsked(int amount) =>
      appRatingLastAsked = appRatingLastAsked + amount;

  bool hasAppRatingLastAsked() => _appRatingLastAsked != null;

  static MetricsDataStruct fromMap(Map<String, dynamic> data) =>
      MetricsDataStruct(
        sIGNINAuthVariant: data['SIGN-IN_auth_variant'] as String?,
        sIGNINAuthEaseRating: castToType<int>(data['SIGN-IN_auth_ease_rating']),
        sIGNINRatingShown: data['SIGN-IN_rating_shown'] as bool?,
        timesAuthenticated: castToType<int>(data['times_authenticated']),
        appRatingLatest: castToType<int>(data['app_rating_latest']),
        appRatingHistory: getDataList(data['app_rating_history']),
        appRatingLastAsked: castToType<int>(data['app_rating_last_asked']),
      );

  static MetricsDataStruct? maybeFromMap(dynamic data) => data is Map
      ? MetricsDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'SIGN-IN_auth_variant': _sIGNINAuthVariant,
        'SIGN-IN_auth_ease_rating': _sIGNINAuthEaseRating,
        'SIGN-IN_rating_shown': _sIGNINRatingShown,
        'times_authenticated': _timesAuthenticated,
        'app_rating_latest': _appRatingLatest,
        'app_rating_history': _appRatingHistory,
        'app_rating_last_asked': _appRatingLastAsked,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'SIGN-IN_auth_variant': serializeParam(
          _sIGNINAuthVariant,
          ParamType.String,
        ),
        'SIGN-IN_auth_ease_rating': serializeParam(
          _sIGNINAuthEaseRating,
          ParamType.int,
        ),
        'SIGN-IN_rating_shown': serializeParam(
          _sIGNINRatingShown,
          ParamType.bool,
        ),
        'times_authenticated': serializeParam(
          _timesAuthenticated,
          ParamType.int,
        ),
        'app_rating_latest': serializeParam(
          _appRatingLatest,
          ParamType.int,
        ),
        'app_rating_history': serializeParam(
          _appRatingHistory,
          ParamType.int,
          isList: true,
        ),
        'app_rating_last_asked': serializeParam(
          _appRatingLastAsked,
          ParamType.int,
        ),
      }.withoutNulls;

  static MetricsDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      MetricsDataStruct(
        sIGNINAuthVariant: deserializeParam(
          data['SIGN-IN_auth_variant'],
          ParamType.String,
          false,
        ),
        sIGNINAuthEaseRating: deserializeParam(
          data['SIGN-IN_auth_ease_rating'],
          ParamType.int,
          false,
        ),
        sIGNINRatingShown: deserializeParam(
          data['SIGN-IN_rating_shown'],
          ParamType.bool,
          false,
        ),
        timesAuthenticated: deserializeParam(
          data['times_authenticated'],
          ParamType.int,
          false,
        ),
        appRatingLatest: deserializeParam(
          data['app_rating_latest'],
          ParamType.int,
          false,
        ),
        appRatingHistory: deserializeParam<int>(
          data['app_rating_history'],
          ParamType.int,
          true,
        ),
        appRatingLastAsked: deserializeParam(
          data['app_rating_last_asked'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'MetricsDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MetricsDataStruct &&
        sIGNINAuthVariant == other.sIGNINAuthVariant &&
        sIGNINAuthEaseRating == other.sIGNINAuthEaseRating &&
        sIGNINRatingShown == other.sIGNINRatingShown &&
        timesAuthenticated == other.timesAuthenticated &&
        appRatingLatest == other.appRatingLatest &&
        listEquality.equals(appRatingHistory, other.appRatingHistory) &&
        appRatingLastAsked == other.appRatingLastAsked;
  }

  @override
  int get hashCode => const ListEquality().hash([
        sIGNINAuthVariant,
        sIGNINAuthEaseRating,
        sIGNINRatingShown,
        timesAuthenticated,
        appRatingLatest,
        const ListEquality().hash(appRatingHistory),
        appRatingLastAsked
      ]);
}

MetricsDataStruct createMetricsDataStruct({
  String? sIGNINAuthVariant,
  int? sIGNINAuthEaseRating,
  bool? sIGNINRatingShown,
  int? timesAuthenticated,
  int? appRatingLatest,
  int? appRatingLastAsked,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MetricsDataStruct(
      sIGNINAuthVariant: sIGNINAuthVariant,
      sIGNINAuthEaseRating: sIGNINAuthEaseRating,
      sIGNINRatingShown: sIGNINRatingShown,
      timesAuthenticated: timesAuthenticated,
      appRatingLatest: appRatingLatest,
      appRatingLastAsked: appRatingLastAsked,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MetricsDataStruct? updateMetricsDataStruct(
  MetricsDataStruct? metricsData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    metricsData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMetricsDataStructData(
  Map<String, dynamic> firestoreData,
  MetricsDataStruct? metricsData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (metricsData == null) {
    return;
  }
  if (metricsData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && metricsData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final metricsDataData =
      getMetricsDataFirestoreData(metricsData, forFieldValue);
  final nestedData =
      metricsDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = metricsData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMetricsDataFirestoreData(
  MetricsDataStruct? metricsData, [
  bool forFieldValue = false,
]) {
  if (metricsData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(metricsData.toMap());

  // Add any Firestore field values
  mapToFirestore(metricsData.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMetricsDataListFirestoreData(
  List<MetricsDataStruct>? metricsDatas,
) =>
    metricsDatas?.map((e) => getMetricsDataFirestoreData(e, true)).toList() ??
    [];
