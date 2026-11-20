import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvailabilityRecord extends FirestoreRecord {
  AvailabilityRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "dayOfWeek" field.
  String? _dayOfWeek;
  String get dayOfWeek => _dayOfWeek ?? '';
  bool hasDayOfWeek() => _dayOfWeek != null;

  // "endTime" field.
  String? _endTime;
  String get endTime => _endTime ?? '';
  bool hasEndTime() => _endTime != null;

  // "startTime" field.
  String? _startTime;
  String get startTime => _startTime ?? '';
  bool hasStartTime() => _startTime != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _dayOfWeek = snapshotData['dayOfWeek'] as String?;
    _endTime = snapshotData['endTime'] as String?;
    _startTime = snapshotData['startTime'] as String?;
    _subject = snapshotData['subject'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('availability')
          : FirebaseFirestore.instance.collectionGroup('availability');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('availability').doc(id);

  static Stream<AvailabilityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AvailabilityRecord.fromSnapshot(s));

  static Future<AvailabilityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AvailabilityRecord.fromSnapshot(s));

  static AvailabilityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AvailabilityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AvailabilityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AvailabilityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AvailabilityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AvailabilityRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createAvailabilityRecordData({
  String? dayOfWeek,
  String? endTime,
  String? startTime,
  String? subject,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dayOfWeek': dayOfWeek,
      'endTime': endTime,
      'startTime': startTime,
      'subject': subject,
    }.withoutNulls,
  );

  return firestoreData;
}

class AvailabilityRecordDocumentEquality
    implements Equality<AvailabilityRecord> {
  const AvailabilityRecordDocumentEquality();

  @override
  bool equals(AvailabilityRecord? e1, AvailabilityRecord? e2) {
    return e1?.dayOfWeek == e2?.dayOfWeek &&
        e1?.endTime == e2?.endTime &&
        e1?.startTime == e2?.startTime &&
        e1?.subject == e2?.subject;
  }

  @override
  int hash(AvailabilityRecord? e) => const ListEquality()
      .hash([e?.dayOfWeek, e?.endTime, e?.startTime, e?.subject]);

  @override
  bool isValidKey(Object? o) => o is AvailabilityRecord;
}
