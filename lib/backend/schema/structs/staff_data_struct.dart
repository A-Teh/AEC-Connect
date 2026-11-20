// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Structure containing staff member data
///
class StaffDataStruct extends FFFirebaseStruct {
  StaffDataStruct({
    String? employeeId,
    String? employeeTitle,

    /// Both the user_role and the employee permission level must match in order
    /// to grant the user the specified permissions.
    List<EnumPermissions>? employeePermissions,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _employeeId = employeeId,
        _employeeTitle = employeeTitle,
        _employeePermissions = employeePermissions,
        super(firestoreUtilData);

  // "employee_id" field.
  String? _employeeId;
  String get employeeId => _employeeId ?? '';
  set employeeId(String? val) => _employeeId = val;

  bool hasEmployeeId() => _employeeId != null;

  // "employee_title" field.
  String? _employeeTitle;
  String get employeeTitle => _employeeTitle ?? '';
  set employeeTitle(String? val) => _employeeTitle = val;

  bool hasEmployeeTitle() => _employeeTitle != null;

  // "employee_permissions" field.
  List<EnumPermissions>? _employeePermissions;
  List<EnumPermissions> get employeePermissions =>
      _employeePermissions ?? const [];
  set employeePermissions(List<EnumPermissions>? val) =>
      _employeePermissions = val;

  void updateEmployeePermissions(Function(List<EnumPermissions>) updateFn) {
    updateFn(_employeePermissions ??= []);
  }

  bool hasEmployeePermissions() => _employeePermissions != null;

  static StaffDataStruct fromMap(Map<String, dynamic> data) => StaffDataStruct(
        employeeId: data['employee_id'] as String?,
        employeeTitle: data['employee_title'] as String?,
        employeePermissions:
            getEnumList<EnumPermissions>(data['employee_permissions']),
      );

  static StaffDataStruct? maybeFromMap(dynamic data) => data is Map
      ? StaffDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'employee_id': _employeeId,
        'employee_title': _employeeTitle,
        'employee_permissions':
            _employeePermissions?.map((e) => e.serialize()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'employee_id': serializeParam(
          _employeeId,
          ParamType.String,
        ),
        'employee_title': serializeParam(
          _employeeTitle,
          ParamType.String,
        ),
        'employee_permissions': serializeParam(
          _employeePermissions,
          ParamType.Enum,
          isList: true,
        ),
      }.withoutNulls;

  static StaffDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      StaffDataStruct(
        employeeId: deserializeParam(
          data['employee_id'],
          ParamType.String,
          false,
        ),
        employeeTitle: deserializeParam(
          data['employee_title'],
          ParamType.String,
          false,
        ),
        employeePermissions: deserializeParam<EnumPermissions>(
          data['employee_permissions'],
          ParamType.Enum,
          true,
        ),
      );

  @override
  String toString() => 'StaffDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StaffDataStruct &&
        employeeId == other.employeeId &&
        employeeTitle == other.employeeTitle &&
        listEquality.equals(employeePermissions, other.employeePermissions);
  }

  @override
  int get hashCode => const ListEquality().hash([
        employeeId,
        employeeTitle,
        const ListEquality().hash(employeePermissions)
      ]);
}

StaffDataStruct createStaffDataStruct({
  String? employeeId,
  String? employeeTitle,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StaffDataStruct(
      employeeId: employeeId,
      employeeTitle: employeeTitle,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StaffDataStruct? updateStaffDataStruct(
  StaffDataStruct? staffData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    staffData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStaffDataStructData(
  Map<String, dynamic> firestoreData,
  StaffDataStruct? staffData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (staffData == null) {
    return;
  }
  if (staffData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && staffData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final staffDataData = getStaffDataFirestoreData(staffData, forFieldValue);
  final nestedData = staffDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = staffData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStaffDataFirestoreData(
  StaffDataStruct? staffData, [
  bool forFieldValue = false,
]) {
  if (staffData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(staffData.toMap());

  // Add any Firestore field values
  mapToFirestore(staffData.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStaffDataListFirestoreData(
  List<StaffDataStruct>? staffDatas,
) =>
    staffDatas?.map((e) => getStaffDataFirestoreData(e, true)).toList() ?? [];
