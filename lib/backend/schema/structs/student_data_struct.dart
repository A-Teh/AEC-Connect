// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Structure containing student data.
class StudentDataStruct extends FFFirebaseStruct {
  StudentDataStruct({
    String? studentID,

    /// A list of majors that the student is enrolled in.
    List<String>? majors,

    /// The current year of the student (Freshman, Sophomore, etc)
    String? acedemicYear,
    List<String>? subjectsNeeded,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _studentID = studentID,
        _majors = majors,
        _acedemicYear = acedemicYear,
        _subjectsNeeded = subjectsNeeded,
        super(firestoreUtilData);

  // "studentID" field.
  String? _studentID;
  String get studentID => _studentID ?? '';
  set studentID(String? val) => _studentID = val;

  bool hasStudentID() => _studentID != null;

  // "majors" field.
  List<String>? _majors;
  List<String> get majors => _majors ?? const [];
  set majors(List<String>? val) => _majors = val;

  void updateMajors(Function(List<String>) updateFn) {
    updateFn(_majors ??= []);
  }

  bool hasMajors() => _majors != null;

  // "acedemic_year" field.
  String? _acedemicYear;
  String get acedemicYear => _acedemicYear ?? '';
  set acedemicYear(String? val) => _acedemicYear = val;

  bool hasAcedemicYear() => _acedemicYear != null;

  // "subjects_needed" field.
  List<String>? _subjectsNeeded;
  List<String> get subjectsNeeded => _subjectsNeeded ?? const [];
  set subjectsNeeded(List<String>? val) => _subjectsNeeded = val;

  void updateSubjectsNeeded(Function(List<String>) updateFn) {
    updateFn(_subjectsNeeded ??= []);
  }

  bool hasSubjectsNeeded() => _subjectsNeeded != null;

  static StudentDataStruct fromMap(Map<String, dynamic> data) =>
      StudentDataStruct(
        studentID: data['studentID'] as String?,
        majors: getDataList(data['majors']),
        acedemicYear: data['acedemic_year'] as String?,
        subjectsNeeded: getDataList(data['subjects_needed']),
      );

  static StudentDataStruct? maybeFromMap(dynamic data) => data is Map
      ? StudentDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'studentID': _studentID,
        'majors': _majors,
        'acedemic_year': _acedemicYear,
        'subjects_needed': _subjectsNeeded,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'studentID': serializeParam(
          _studentID,
          ParamType.String,
        ),
        'majors': serializeParam(
          _majors,
          ParamType.String,
          isList: true,
        ),
        'acedemic_year': serializeParam(
          _acedemicYear,
          ParamType.String,
        ),
        'subjects_needed': serializeParam(
          _subjectsNeeded,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static StudentDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      StudentDataStruct(
        studentID: deserializeParam(
          data['studentID'],
          ParamType.String,
          false,
        ),
        majors: deserializeParam<String>(
          data['majors'],
          ParamType.String,
          true,
        ),
        acedemicYear: deserializeParam(
          data['acedemic_year'],
          ParamType.String,
          false,
        ),
        subjectsNeeded: deserializeParam<String>(
          data['subjects_needed'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'StudentDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StudentDataStruct &&
        studentID == other.studentID &&
        listEquality.equals(majors, other.majors) &&
        acedemicYear == other.acedemicYear &&
        listEquality.equals(subjectsNeeded, other.subjectsNeeded);
  }

  @override
  int get hashCode => const ListEquality().hash([
        studentID,
        const ListEquality().hash(majors),
        acedemicYear,
        const ListEquality().hash(subjectsNeeded)
      ]);
}

StudentDataStruct createStudentDataStruct({
  String? studentID,
  String? acedemicYear,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StudentDataStruct(
      studentID: studentID,
      acedemicYear: acedemicYear,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StudentDataStruct? updateStudentDataStruct(
  StudentDataStruct? studentData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    studentData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStudentDataStructData(
  Map<String, dynamic> firestoreData,
  StudentDataStruct? studentData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (studentData == null) {
    return;
  }
  if (studentData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && studentData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final studentDataData =
      getStudentDataFirestoreData(studentData, forFieldValue);
  final nestedData =
      studentDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = studentData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStudentDataFirestoreData(
  StudentDataStruct? studentData, [
  bool forFieldValue = false,
]) {
  if (studentData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(studentData.toMap());

  // Add any Firestore field values
  mapToFirestore(studentData.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStudentDataListFirestoreData(
  List<StudentDataStruct>? studentDatas,
) =>
    studentDatas?.map((e) => getStudentDataFirestoreData(e, true)).toList() ??
    [];
