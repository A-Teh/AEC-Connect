import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'user_login_widget.dart' show UserLoginWidget;
import 'package:flutter/material.dart';

class UserLoginModel extends FlutterFlowModel<UserLoginWidget> {
  ///  Local state fields for this page.
  /// A boolean that records whether the user has ever had a keystroke in the
  /// URI email textbox.
  bool bDidEverWriteInEmail = false;

  String installationId = 'loading';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - getInstallationId] action in UserLogin widget.
  String? installId;
  // State field(s) for EmailInput widget.
  FocusNode? emailInputFocusNode;
  TextEditingController? emailInputTextController;
  String? Function(BuildContext, String?)? emailInputTextControllerValidator;
  // State field(s) for PasswordInput widget.
  late FocusNode passwordInputPasswordVisibilityFocusNode;
  FocusNode? passwordInputFocusNode;
  TextEditingController? passwordInputTextController;
  late bool passwordInputVisibility;
  String? Function(BuildContext, String?)? passwordInputTextControllerValidator;
  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    passwordInputPasswordVisibilityFocusNode = FocusNode();
    passwordInputVisibility = false;
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    emailInputFocusNode?.dispose();
    emailInputTextController?.dispose();

    passwordInputFocusNode?.dispose();
    passwordInputTextController?.dispose();
    passwordInputPasswordVisibilityFocusNode.dispose();
    buttonModel.dispose();
  }
}
