import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "user_roles" field.
  List<EnumRole>? _userRoles;
  List<EnumRole> get userRoles => _userRoles ?? const [];
  bool hasUserRoles() => _userRoles != null;

  // "student_information" field.
  StudentDataStruct? _studentInformation;
  StudentDataStruct get studentInformation =>
      _studentInformation ?? StudentDataStruct();
  bool hasStudentInformation() => _studentInformation != null;

  // "tutor_information" field.
  TutorDataStruct? _tutorInformation;
  TutorDataStruct get tutorInformation =>
      _tutorInformation ?? TutorDataStruct();
  bool hasTutorInformation() => _tutorInformation != null;

  // "staff_information" field.
  StaffDataStruct? _staffInformation;
  StaffDataStruct get staffInformation =>
      _staffInformation ?? StaffDataStruct();
  bool hasStaffInformation() => _staffInformation != null;

  // "notification_information" field.
  NotificationDataStruct? _notificationInformation;
  NotificationDataStruct get notificationInformation =>
      _notificationInformation ?? NotificationDataStruct();
  bool hasNotificationInformation() => _notificationInformation != null;

  // "metrics_information" field.
  MetricsDataStruct? _metricsInformation;
  MetricsDataStruct get metricsInformation =>
      _metricsInformation ?? MetricsDataStruct();
  bool hasMetricsInformation() => _metricsInformation != null;

  // "tutors" field.
  TutorDataStruct? _tutors;
  TutorDataStruct get tutors => _tutors ?? TutorDataStruct();
  bool hasTutors() => _tutors != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _userRoles = getEnumList<EnumRole>(snapshotData['user_roles']);
    _studentInformation = snapshotData['student_information']
            is StudentDataStruct
        ? snapshotData['student_information']
        : StudentDataStruct.maybeFromMap(snapshotData['student_information']);
    _tutorInformation = snapshotData['tutor_information'] is TutorDataStruct
        ? snapshotData['tutor_information']
        : TutorDataStruct.maybeFromMap(snapshotData['tutor_information']);
    _staffInformation = snapshotData['staff_information'] is StaffDataStruct
        ? snapshotData['staff_information']
        : StaffDataStruct.maybeFromMap(snapshotData['staff_information']);
    _notificationInformation =
        snapshotData['notification_information'] is NotificationDataStruct
            ? snapshotData['notification_information']
            : NotificationDataStruct.maybeFromMap(
                snapshotData['notification_information']);
    _metricsInformation = snapshotData['metrics_information']
            is MetricsDataStruct
        ? snapshotData['metrics_information']
        : MetricsDataStruct.maybeFromMap(snapshotData['metrics_information']);
    _tutors = snapshotData['tutors'] is TutorDataStruct
        ? snapshotData['tutors']
        : TutorDataStruct.maybeFromMap(snapshotData['tutors']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  StudentDataStruct? studentInformation,
  TutorDataStruct? tutorInformation,
  StaffDataStruct? staffInformation,
  NotificationDataStruct? notificationInformation,
  MetricsDataStruct? metricsInformation,
  TutorDataStruct? tutors,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'student_information': StudentDataStruct().toMap(),
      'tutor_information': TutorDataStruct().toMap(),
      'staff_information': StaffDataStruct().toMap(),
      'notification_information': NotificationDataStruct().toMap(),
      'metrics_information': MetricsDataStruct().toMap(),
      'tutors': TutorDataStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "student_information" field.
  addStudentDataStructData(
      firestoreData, studentInformation, 'student_information');

  // Handle nested data for "tutor_information" field.
  addTutorDataStructData(firestoreData, tutorInformation, 'tutor_information');

  // Handle nested data for "staff_information" field.
  addStaffDataStructData(firestoreData, staffInformation, 'staff_information');

  // Handle nested data for "notification_information" field.
  addNotificationDataStructData(
      firestoreData, notificationInformation, 'notification_information');

  // Handle nested data for "metrics_information" field.
  addMetricsDataStructData(
      firestoreData, metricsInformation, 'metrics_information');

  // Handle nested data for "tutors" field.
  addTutorDataStructData(firestoreData, tutors, 'tutors');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(e1?.userRoles, e2?.userRoles) &&
        e1?.studentInformation == e2?.studentInformation &&
        e1?.tutorInformation == e2?.tutorInformation &&
        e1?.staffInformation == e2?.staffInformation &&
        e1?.notificationInformation == e2?.notificationInformation &&
        e1?.metricsInformation == e2?.metricsInformation &&
        e1?.tutors == e2?.tutors;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        const ListEquality().hash(e?.userRoles),
        e?.studentInformation,
        e?.tutorInformation,
        e?.staffInformation,
        e?.notificationInformation,
        e?.metricsInformation,
        e?.tutors
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
