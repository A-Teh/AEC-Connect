import '/flutter_flow/flutter_flow_util.dart';
import 'course_card_widget.dart' show CourseCardWidget;
import 'package:flutter/material.dart';

class CourseCardModel extends FlutterFlowModel<CourseCardWidget> {
  ///  Local state fields for this component.

  String? classDescription;

  List<String> workingTutors = [];
  void addToWorkingTutors(String item) => workingTutors.add(item);
  void removeFromWorkingTutors(String item) => workingTutors.remove(item);
  void removeAtIndexFromWorkingTutors(int index) =>
      workingTutors.removeAt(index);
  void insertAtIndexInWorkingTutors(int index, String item) =>
      workingTutors.insert(index, item);
  void updateWorkingTutorsAtIndex(int index, Function(String) updateFn) =>
      workingTutors[index] = updateFn(workingTutors[index]);

  bool availabilityChecked = false;

  bool isLoaded = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - getWorkingTutors] action in CourseCard widget.
  List<String>? workingNames;
  // Stores action output result for [Custom Action - getNextAvailability] action in CourseCard widget.
  String? nextAvailable;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
