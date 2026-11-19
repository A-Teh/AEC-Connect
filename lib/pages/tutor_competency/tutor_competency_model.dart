import '/components/course_chip_widget.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'tutor_competency_widget.dart' show TutorCompetencyWidget;
import 'package:flutter/material.dart';

class TutorCompetencyModel extends FlutterFlowModel<TutorCompetencyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TopBar.
  late TopBarModel topBarModel;
  // Model for CourseChip.
  late CourseChipModel courseChipModel;

  @override
  void initState(BuildContext context) {
    topBarModel = createModel(context, () => TopBarModel());
    courseChipModel = createModel(context, () => CourseChipModel());
  }

  @override
  void dispose() {
    topBarModel.dispose();
    courseChipModel.dispose();
  }
}
