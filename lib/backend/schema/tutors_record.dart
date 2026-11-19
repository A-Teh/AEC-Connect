import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TutorsRecord extends FirestoreRecord {
  TutorsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "competencies" field.
  List<String>? _competencies;
  List<String> get competencies => _competencies ?? const [];
  bool hasCompetencies() => _competencies != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _competencies = getDataList(snapshotData['competencies']);
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tutors');

  static Stream<TutorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TutorsRecord.fromSnapshot(s));

  static Future<TutorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TutorsRecord.fromSnapshot(s));

  static TutorsRecord fromSnapshot(DocumentSnapshot snapshot) => TutorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TutorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TutorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TutorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TutorsRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createTutorsRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class TutorsRecordDocumentEquality implements Equality<TutorsRecord> {
  const TutorsRecordDocumentEquality();

  @override
  bool equals(TutorsRecord? e1, TutorsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.competencies, e2?.competencies) &&
        e1?.name == e2?.name;
  }

  @override
  int hash(TutorsRecord? e) => const ListEquality()
      .hash([const ListEquality().hash(e?.competencies), e?.name]);

  @override
  bool isValidKey(Object? o) => o is TutorsRecord;
}
