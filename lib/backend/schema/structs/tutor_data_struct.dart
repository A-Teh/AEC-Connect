// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Structure containing tutor data
class TutorDataStruct extends FFFirebaseStruct {
  TutorDataStruct({
    String? employeeId,

    /// The status of the employee
    EnumStatus? employeeStatus,

    /// The datetime the employee was hired.
    DateTime? hireDate,

    /// A list of courses that this tutor offers.
    List<String>? competencyCourses,

    /// This is a fallback leveraged by the AI.
    ///
    /// It represents a list of course codes that a tutor is familiar with, but
    /// isn't neccessarily willing to tutor regularly.
    List<String>? familiarCourses,

    /// A list of areas that this tutor is familiar with.
    List<String>? subjects,

    /// A short bio that students can look at to get a feel.
    String? bio,

    /// A list of offered languages that the tutor can speak in.
    List<String>? offeredLanguages,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _employeeId = employeeId,
        _employeeStatus = employeeStatus,
        _hireDate = hireDate,
        _competencyCourses = competencyCourses,
        _familiarCourses = familiarCourses,
        _subjects = subjects,
        _bio = bio,
        _offeredLanguages = offeredLanguages,
        super(firestoreUtilData);

  // "employee_id" field.
  String? _employeeId;
  String get employeeId => _employeeId ?? '';
  set employeeId(String? val) => _employeeId = val;

  bool hasEmployeeId() => _employeeId != null;

  // "employee_status" field.
  EnumStatus? _employeeStatus;
  EnumStatus? get employeeStatus => _employeeStatus;
  set employeeStatus(EnumStatus? val) => _employeeStatus = val;

  bool hasEmployeeStatus() => _employeeStatus != null;

  // "hire_date" field.
  DateTime? _hireDate;
  DateTime? get hireDate => _hireDate;
  set hireDate(DateTime? val) => _hireDate = val;

  bool hasHireDate() => _hireDate != null;

  // "competency_courses" field.
  List<String>? _competencyCourses;
  List<String> get competencyCourses => _competencyCourses ?? const [];
  set competencyCourses(List<String>? val) => _competencyCourses = val;

  void updateCompetencyCourses(Function(List<String>) updateFn) {
    updateFn(_competencyCourses ??= []);
  }

  bool hasCompetencyCourses() => _competencyCourses != null;

  // "familiar_courses" field.
  List<String>? _familiarCourses;
  List<String> get familiarCourses => _familiarCourses ?? const [];
  set familiarCourses(List<String>? val) => _familiarCourses = val;

  void updateFamiliarCourses(Function(List<String>) updateFn) {
    updateFn(_familiarCourses ??= []);
  }

  bool hasFamiliarCourses() => _familiarCourses != null;

  // "subjects" field.
  List<String>? _subjects;
  List<String> get subjects => _subjects ?? const [];
  set subjects(List<String>? val) => _subjects = val;

  void updateSubjects(Function(List<String>) updateFn) {
    updateFn(_subjects ??= []);
  }

  bool hasSubjects() => _subjects != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  set bio(String? val) => _bio = val;

  bool hasBio() => _bio != null;

  // "offered_languages" field.
  List<String>? _offeredLanguages;
  List<String> get offeredLanguages => _offeredLanguages ?? const [];
  set offeredLanguages(List<String>? val) => _offeredLanguages = val;

  void updateOfferedLanguages(Function(List<String>) updateFn) {
    updateFn(_offeredLanguages ??= []);
  }

  bool hasOfferedLanguages() => _offeredLanguages != null;

  static TutorDataStruct fromMap(Map<String, dynamic> data) => TutorDataStruct(
        employeeId: data['employee_id'] as String?,
        employeeStatus: data['employee_status'] is EnumStatus
            ? data['employee_status']
            : deserializeEnum<EnumStatus>(data['employee_status']),
        hireDate: data['hire_date'] as DateTime?,
        competencyCourses: getDataList(data['competency_courses']),
        familiarCourses: getDataList(data['familiar_courses']),
        subjects: getDataList(data['subjects']),
        bio: data['bio'] as String?,
        offeredLanguages: getDataList(data['offered_languages']),
      );

  static TutorDataStruct? maybeFromMap(dynamic data) => data is Map
      ? TutorDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'employee_id': _employeeId,
        'employee_status': _employeeStatus?.serialize(),
        'hire_date': _hireDate,
        'competency_courses': _competencyCourses,
        'familiar_courses': _familiarCourses,
        'subjects': _subjects,
        'bio': _bio,
        'offered_languages': _offeredLanguages,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'employee_id': serializeParam(
          _employeeId,
          ParamType.String,
        ),
        'employee_status': serializeParam(
          _employeeStatus,
          ParamType.Enum,
        ),
        'hire_date': serializeParam(
          _hireDate,
          ParamType.DateTime,
        ),
        'competency_courses': serializeParam(
          _competencyCourses,
          ParamType.String,
          isList: true,
        ),
        'familiar_courses': serializeParam(
          _familiarCourses,
          ParamType.String,
          isList: true,
        ),
        'subjects': serializeParam(
          _subjects,
          ParamType.String,
          isList: true,
        ),
        'bio': serializeParam(
          _bio,
          ParamType.String,
        ),
        'offered_languages': serializeParam(
          _offeredLanguages,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static TutorDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      TutorDataStruct(
        employeeId: deserializeParam(
          data['employee_id'],
          ParamType.String,
          false,
        ),
        employeeStatus: deserializeParam<EnumStatus>(
          data['employee_status'],
          ParamType.Enum,
          false,
        ),
        hireDate: deserializeParam(
          data['hire_date'],
          ParamType.DateTime,
          false,
        ),
        competencyCourses: deserializeParam<String>(
          data['competency_courses'],
          ParamType.String,
          true,
        ),
        familiarCourses: deserializeParam<String>(
          data['familiar_courses'],
          ParamType.String,
          true,
        ),
        subjects: deserializeParam<String>(
          data['subjects'],
          ParamType.String,
          true,
        ),
        bio: deserializeParam(
          data['bio'],
          ParamType.String,
          false,
        ),
        offeredLanguages: deserializeParam<String>(
          data['offered_languages'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'TutorDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TutorDataStruct &&
        employeeId == other.employeeId &&
        employeeStatus == other.employeeStatus &&
        hireDate == other.hireDate &&
        listEquality.equals(competencyCourses, other.competencyCourses) &&
        listEquality.equals(familiarCourses, other.familiarCourses) &&
        listEquality.equals(subjects, other.subjects) &&
        bio == other.bio &&
        listEquality.equals(offeredLanguages, other.offeredLanguages);
  }

  @override
  int get hashCode => const ListEquality().hash([
        employeeId,
        employeeStatus,
        hireDate,
        const ListEquality().hash(competencyCourses),
        const ListEquality().hash(familiarCourses),
        const ListEquality().hash(subjects),
        bio,
        const ListEquality().hash(offeredLanguages)
      ]);
}

TutorDataStruct createTutorDataStruct({
  String? employeeId,
  EnumStatus? employeeStatus,
  DateTime? hireDate,
  String? bio,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TutorDataStruct(
      employeeId: employeeId,
      employeeStatus: employeeStatus,
      hireDate: hireDate,
      bio: bio,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TutorDataStruct? updateTutorDataStruct(
  TutorDataStruct? tutorData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tutorData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTutorDataStructData(
  Map<String, dynamic> firestoreData,
  TutorDataStruct? tutorData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tutorData == null) {
    return;
  }
  if (tutorData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tutorData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tutorDataData = getTutorDataFirestoreData(tutorData, forFieldValue);
  final nestedData = tutorDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tutorData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTutorDataFirestoreData(
  TutorDataStruct? tutorData, [
  bool forFieldValue = false,
]) {
  if (tutorData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tutorData.toMap());

  // Add any Firestore field values
  mapToFirestore(tutorData.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTutorDataListFirestoreData(
  List<TutorDataStruct>? tutorDatas,
) =>
    tutorDatas?.map((e) => getTutorDataFirestoreData(e, true)).toList() ?? [];
