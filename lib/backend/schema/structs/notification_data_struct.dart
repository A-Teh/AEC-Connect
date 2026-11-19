// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// A structure containing notification data for the user.
class NotificationDataStruct extends FFFirebaseStruct {
  NotificationDataStruct({
    bool? doEmail,
    bool? doPush,
    bool? doSms,
    String? phone,

    /// Tokens that enable notifications
    List<String>? fcmTokens,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _doEmail = doEmail,
        _doPush = doPush,
        _doSms = doSms,
        _phone = phone,
        _fcmTokens = fcmTokens,
        super(firestoreUtilData);

  // "do_email" field.
  bool? _doEmail;
  bool get doEmail => _doEmail ?? false;
  set doEmail(bool? val) => _doEmail = val;

  bool hasDoEmail() => _doEmail != null;

  // "do_push" field.
  bool? _doPush;
  bool get doPush => _doPush ?? false;
  set doPush(bool? val) => _doPush = val;

  bool hasDoPush() => _doPush != null;

  // "do_sms" field.
  bool? _doSms;
  bool get doSms => _doSms ?? false;
  set doSms(bool? val) => _doSms = val;

  bool hasDoSms() => _doSms != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;

  bool hasPhone() => _phone != null;

  // "fcm_tokens" field.
  List<String>? _fcmTokens;
  List<String> get fcmTokens => _fcmTokens ?? const [];
  set fcmTokens(List<String>? val) => _fcmTokens = val;

  void updateFcmTokens(Function(List<String>) updateFn) {
    updateFn(_fcmTokens ??= []);
  }

  bool hasFcmTokens() => _fcmTokens != null;

  static NotificationDataStruct fromMap(Map<String, dynamic> data) =>
      NotificationDataStruct(
        doEmail: data['do_email'] as bool?,
        doPush: data['do_push'] as bool?,
        doSms: data['do_sms'] as bool?,
        phone: data['phone'] as String?,
        fcmTokens: getDataList(data['fcm_tokens']),
      );

  static NotificationDataStruct? maybeFromMap(dynamic data) => data is Map
      ? NotificationDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'do_email': _doEmail,
        'do_push': _doPush,
        'do_sms': _doSms,
        'phone': _phone,
        'fcm_tokens': _fcmTokens,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'do_email': serializeParam(
          _doEmail,
          ParamType.bool,
        ),
        'do_push': serializeParam(
          _doPush,
          ParamType.bool,
        ),
        'do_sms': serializeParam(
          _doSms,
          ParamType.bool,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'fcm_tokens': serializeParam(
          _fcmTokens,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static NotificationDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NotificationDataStruct(
        doEmail: deserializeParam(
          data['do_email'],
          ParamType.bool,
          false,
        ),
        doPush: deserializeParam(
          data['do_push'],
          ParamType.bool,
          false,
        ),
        doSms: deserializeParam(
          data['do_sms'],
          ParamType.bool,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        fcmTokens: deserializeParam<String>(
          data['fcm_tokens'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'NotificationDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is NotificationDataStruct &&
        doEmail == other.doEmail &&
        doPush == other.doPush &&
        doSms == other.doSms &&
        phone == other.phone &&
        listEquality.equals(fcmTokens, other.fcmTokens);
  }

  @override
  int get hashCode => const ListEquality().hash(
      [doEmail, doPush, doSms, phone, const ListEquality().hash(fcmTokens)]);
}

NotificationDataStruct createNotificationDataStruct({
  bool? doEmail,
  bool? doPush,
  bool? doSms,
  String? phone,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NotificationDataStruct(
      doEmail: doEmail,
      doPush: doPush,
      doSms: doSms,
      phone: phone,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NotificationDataStruct? updateNotificationDataStruct(
  NotificationDataStruct? notificationData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    notificationData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNotificationDataStructData(
  Map<String, dynamic> firestoreData,
  NotificationDataStruct? notificationData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (notificationData == null) {
    return;
  }
  if (notificationData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && notificationData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final notificationDataData =
      getNotificationDataFirestoreData(notificationData, forFieldValue);
  final nestedData =
      notificationDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = notificationData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNotificationDataFirestoreData(
  NotificationDataStruct? notificationData, [
  bool forFieldValue = false,
]) {
  if (notificationData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(notificationData.toMap());

  // Add any Firestore field values
  mapToFirestore(notificationData.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNotificationDataListFirestoreData(
  List<NotificationDataStruct>? notificationDatas,
) =>
    notificationDatas
        ?.map((e) => getNotificationDataFirestoreData(e, true))
        .toList() ??
    [];
