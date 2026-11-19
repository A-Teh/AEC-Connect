import '/flutter_flow/flutter_flow_util.dart';
import 'email_widget.dart' show EmailWidget;
import 'package:flutter/material.dart';

class EmailModel extends FlutterFlowModel<EmailWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Input widget.
  FocusNode? inputFocusNode;
  TextEditingController? inputTextController;
  String? Function(BuildContext, String?)? inputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputFocusNode?.dispose();
    inputTextController?.dispose();
  }
}
