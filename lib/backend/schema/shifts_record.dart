import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// A collection of available shifts.
class ShiftsRecord extends FirestoreRecord {
  ShiftsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tutor_uid" field.
  String? _tutorUid;
  String get tutorUid => _tutorUid ?? '';
  bool hasTutorUid() => _tutorUid != null;

  // "term" field.
  String? _term;

  /// Example: "FA26", "SP27", etc.
  String get term => _term ?? '';
  bool hasTerm() => _term != null;

  void _initializeFields() {
    _tutorUid = snapshotData['tutor_uid'] as String?;
    _term = snapshotData['term'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shifts');

  static Stream<ShiftsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShiftsRecord.fromSnapshot(s));

  static Future<ShiftsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShiftsRecord.fromSnapshot(s));

  static ShiftsRecord fromSnapshot(DocumentSnapshot snapshot) => ShiftsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShiftsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShiftsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShiftsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShiftsRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createShiftsRecordData({
  String? tutorUid,
  String? term,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tutor_uid': tutorUid,
      'term': term,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShiftsRecordDocumentEquality implements Equality<ShiftsRecord> {
  const ShiftsRecordDocumentEquality();

  @override
  bool equals(ShiftsRecord? e1, ShiftsRecord? e2) {
    return e1?.tutorUid == e2?.tutorUid && e1?.term == e2?.term;
  }

  @override
  int hash(ShiftsRecord? e) =>
      const ListEquality().hash([e?.tutorUid, e?.term]);

  @override
  bool isValidKey(Object? o) => o is ShiftsRecord;
}
