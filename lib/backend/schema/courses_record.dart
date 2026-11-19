import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// courses offered at the AEC
class CoursesRecord extends FirestoreRecord {
  CoursesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "course_code" field.
  String? _courseCode;
  String get courseCode => _courseCode ?? '';
  bool hasCourseCode() => _courseCode != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "course_name" field.
  String? _courseName;
  String get courseName => _courseName ?? '';
  bool hasCourseName() => _courseName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "has_available_tutor" field.
  bool? _hasAvailableTutor;
  bool get hasAvailableTutor => _hasAvailableTutor ?? false;
  bool hasHasAvailableTutor() => _hasAvailableTutor != null;

  // "availability_updated_at" field.
  DateTime? _availabilityUpdatedAt;
  DateTime? get availabilityUpdatedAt => _availabilityUpdatedAt;
  bool hasAvailabilityUpdatedAt() => _availabilityUpdatedAt != null;

  void _initializeFields() {
    _courseCode = snapshotData['course_code'] as String?;
    _subject = snapshotData['subject'] as String?;
    _isActive = snapshotData['is_active'] as bool?;
    _courseName = snapshotData['course_name'] as String?;
    _description = snapshotData['description'] as String?;
    _hasAvailableTutor = snapshotData['has_available_tutor'] as bool?;
    _availabilityUpdatedAt =
        snapshotData['availability_updated_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('courses');

  static Stream<CoursesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoursesRecord.fromSnapshot(s));

  static Future<CoursesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoursesRecord.fromSnapshot(s));

  static CoursesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoursesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoursesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoursesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoursesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoursesRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createCoursesRecordData({
  String? courseCode,
  String? subject,
  bool? isActive,
  String? courseName,
  String? description,
  bool? hasAvailableTutor,
  DateTime? availabilityUpdatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'course_code': courseCode,
      'subject': subject,
      'is_active': isActive,
      'course_name': courseName,
      'description': description,
      'has_available_tutor': hasAvailableTutor,
      'availability_updated_at': availabilityUpdatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoursesRecordDocumentEquality implements Equality<CoursesRecord> {
  const CoursesRecordDocumentEquality();

  @override
  bool equals(CoursesRecord? e1, CoursesRecord? e2) {
    return e1?.courseCode == e2?.courseCode &&
        e1?.subject == e2?.subject &&
        e1?.isActive == e2?.isActive &&
        e1?.courseName == e2?.courseName &&
        e1?.description == e2?.description &&
        e1?.hasAvailableTutor == e2?.hasAvailableTutor &&
        e1?.availabilityUpdatedAt == e2?.availabilityUpdatedAt;
  }

  @override
  int hash(CoursesRecord? e) => const ListEquality().hash([
        e?.courseCode,
        e?.subject,
        e?.isActive,
        e?.courseName,
        e?.description,
        e?.hasAvailableTutor,
        e?.availabilityUpdatedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is CoursesRecord;
}
