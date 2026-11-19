import '/backend/api_requests/api_calls.dart';
import '/components/button_widget.dart';
import '/components/profile_class_chip_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'profile_setup_widget.dart' show ProfileSetupWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ProfileSetupModel extends FlutterFlowModel<ProfileSetupWidget> {
  ///  Local state fields for this page.
  /// student's full name
  String? displayName = 'John Doe';

  /// Student's major
  String? major = 'Undeclared';

  /// Student's year (eg.
  ///
  /// Freshman, Sophomore_
  String? year = 'Freshman';

  /// Student URI ID
  String? studentId;

  /// Student's Phone Number
  int? phoneNumber;

  /// List of courses Student seeks tutoring in
  List<String> coursesNeeded = [];
  void addToCoursesNeeded(String item) => coursesNeeded.add(item);
  void removeFromCoursesNeeded(String item) => coursesNeeded.remove(item);
  void removeAtIndexFromCoursesNeeded(int index) =>
      coursesNeeded.removeAt(index);
  void insertAtIndexInCoursesNeeded(int index, String item) =>
      coursesNeeded.insert(index, item);
  void updateCoursesNeededAtIndex(int index, Function(String) updateFn) =>
      coursesNeeded[index] = updateFn(coursesNeeded[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_profilePic = false;
  FFUploadedFile uploadedLocalFile_profilePic =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_profilePic = '';

  // State field(s) for Input widget.
  FocusNode? inputFocusNode1;
  TextEditingController? inputTextController1;
  String? Function(BuildContext, String?)? inputTextController1Validator;
  String? _inputTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Name is required';
    }

    return null;
  }

  // State field(s) for Input widget.
  FocusNode? inputFocusNode2;
  TextEditingController? inputTextController2;
  String? Function(BuildContext, String?)? inputTextController2Validator;
  // State field(s) for Dropdown widget.
  String? dropdownValue;
  FormFieldController<String>? dropdownValueController;
  // State field(s) for Input widget.
  FocusNode? inputFocusNode3;
  TextEditingController? inputTextController3;
  late MaskTextInputFormatter inputMask3;
  String? Function(BuildContext, String?)? inputTextController3Validator;
  String? _inputTextController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Student ID is required';
    }

    if (val.length < 9) {
      return 'Requires at least 9 characters.';
    }
    if (val.length > 9) {
      return 'Maximum 9 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for Input widget.
  FocusNode? inputFocusNode4;
  TextEditingController? inputTextController4;
  late MaskTextInputFormatter inputMask4;
  String? Function(BuildContext, String?)? inputTextController4Validator;
  String? _inputTextController4Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Phone Number is required';
    }

    if (val.length < 14) {
      return 'Invalid Phone Number';
    }
    if (val.length > 14) {
      return 'Invalid Phone Number';
    }

    return null;
  }

  // State field(s) for CourseTextField widget.
  FocusNode? courseTextFieldFocusNode;
  TextEditingController? courseTextFieldTextController;
  late MaskTextInputFormatter courseTextFieldMask;
  String? Function(BuildContext, String?)?
      courseTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (Query URI Course)] action in IconButton widget.
  ApiCallResponse? apiCourse;
  // Models for ProfileClassChip dynamic component.
  late FlutterFlowDynamicModels<ProfileClassChipModel> profileClassChipModels;
  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    inputTextController1Validator = _inputTextController1Validator;
    inputTextController3Validator = _inputTextController3Validator;
    inputTextController4Validator = _inputTextController4Validator;
    profileClassChipModels =
        FlutterFlowDynamicModels(() => ProfileClassChipModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    inputFocusNode1?.dispose();
    inputTextController1?.dispose();

    inputFocusNode2?.dispose();
    inputTextController2?.dispose();

    inputFocusNode3?.dispose();
    inputTextController3?.dispose();

    inputFocusNode4?.dispose();
    inputTextController4?.dispose();

    courseTextFieldFocusNode?.dispose();
    courseTextFieldTextController?.dispose();

    profileClassChipModels.dispose();
    buttonModel.dispose();
  }
}
