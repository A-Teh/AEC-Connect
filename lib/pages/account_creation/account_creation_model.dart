import '/components/button2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'account_creation_widget.dart' show AccountCreationWidget;
import 'package:flutter/material.dart';

class AccountCreationModel extends FlutterFlowModel<AccountCreationWidget> {
  ///  Local state fields for this page.

  bool bSignupStartLogged = false;

  String installationId = 'loading';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - getInstallationId] action in AccountCreation widget.
  String? installId;
  // State field(s) for emailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;
  String? _emailFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'URI Email Address is required';
    }

    if (!RegExp('@uri.edu').hasMatch(val)) {
      return 'You must use a URI email.';
    }
    return null;
  }

  // State field(s) for passwordField widget.
  late FocusNode passwordFieldPasswordVisibilityFocusNode;
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldTextController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldTextControllerValidator;
  String? _passwordFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required';
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }
    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for confirmPasswordField widget.
  late FocusNode confirmPasswordFieldPasswordVisibilityFocusNode;
  FocusNode? confirmPasswordFieldFocusNode;
  TextEditingController? confirmPasswordFieldTextController;
  late bool confirmPasswordFieldVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordFieldTextControllerValidator;
  String? _confirmPasswordFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Confirm Password is required';
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }
    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Model for Button.
  late Button2Model buttonModel1;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? bSignUpFormValid;
  // Model for Button.
  late Button2Model buttonModel2;
  // Model for Button.
  late Button2Model buttonModel3;

  @override
  void initState(BuildContext context) {
    emailFieldTextControllerValidator = _emailFieldTextControllerValidator;
    passwordFieldPasswordVisibilityFocusNode = FocusNode();
    passwordFieldVisibility = false;
    passwordFieldTextControllerValidator =
        _passwordFieldTextControllerValidator;
    confirmPasswordFieldPasswordVisibilityFocusNode = FocusNode();
    confirmPasswordFieldVisibility = false;
    confirmPasswordFieldTextControllerValidator =
        _confirmPasswordFieldTextControllerValidator;
    buttonModel1 = createModel(context, () => Button2Model());
    buttonModel2 = createModel(context, () => Button2Model());
    buttonModel3 = createModel(context, () => Button2Model());
  }

  @override
  void dispose() {
    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

    passwordFieldFocusNode?.dispose();
    passwordFieldTextController?.dispose();
    passwordFieldPasswordVisibilityFocusNode.dispose();
    confirmPasswordFieldFocusNode?.dispose();
    confirmPasswordFieldTextController?.dispose();
    confirmPasswordFieldPasswordVisibilityFocusNode.dispose();
    buttonModel1.dispose();
    buttonModel2.dispose();
    buttonModel3.dispose();
  }
}
