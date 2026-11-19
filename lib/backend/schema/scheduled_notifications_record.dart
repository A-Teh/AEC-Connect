import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScheduledNotificationsRecord extends FirestoreRecord {
  ScheduledNotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "course_code" field.
  String? _courseCode;
  String get courseCode => _courseCode ?? '';
  bool hasCourseCode() => _courseCode != null;

  // "scheduled_time" field.
  DateTime? _scheduledTime;
  DateTime? get scheduledTime => _scheduledTime;
  bool hasScheduledTime() => _scheduledTime != null;

  // "notification_sent" field.
  bool? _notificationSent;
  bool get notificationSent => _notificationSent ?? false;
  bool hasNotificationSent() => _notificationSent != null;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _courseCode = snapshotData['course_code'] as String?;
    _scheduledTime = snapshotData['scheduled_time'] as DateTime?;
    _notificationSent = snapshotData['notification_sent'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('scheduled_notifications');

  static Stream<ScheduledNotificationsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => ScheduledNotificationsRecord.fromSnapshot(s));

  static Future<ScheduledNotificationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ScheduledNotificationsRecord.fromSnapshot(s));

  static ScheduledNotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ScheduledNotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScheduledNotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScheduledNotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScheduledNotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ScheduledNotificationsRecord &&
      reference.path == other.reference.path;
}

Map<String, dynamic> createScheduledNotificationsRecordData({
  DocumentReference? userRef,
  String? courseCode,
  DateTime? scheduledTime,
  bool? notificationSent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'course_code': courseCode,
      'scheduled_time': scheduledTime,
      'notification_sent': notificationSent,
    }.withoutNulls,
  );

  return firestoreData;
}

class ScheduledNotificationsRecordDocumentEquality
    implements Equality<ScheduledNotificationsRecord> {
  const ScheduledNotificationsRecordDocumentEquality();

  @override
  bool equals(
      ScheduledNotificationsRecord? e1, ScheduledNotificationsRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.courseCode == e2?.courseCode &&
        e1?.scheduledTime == e2?.scheduledTime &&
        e1?.notificationSent == e2?.notificationSent;
  }

  @override
  int hash(ScheduledNotificationsRecord? e) => const ListEquality()
      .hash([e?.userRef, e?.courseCode, e?.scheduledTime, e?.notificationSent]);

  @override
  bool isValidKey(Object? o) => o is ScheduledNotificationsRecord;
}
