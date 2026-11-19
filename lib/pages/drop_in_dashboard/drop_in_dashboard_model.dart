import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'drop_in_dashboard_widget.dart' show DropInDashboardWidget;
import 'package:flutter/material.dart';

class DropInDashboardModel extends FlutterFlowModel<DropInDashboardWidget> {
  ///  Local state fields for this page.

  List<String> classesDisplayed = [];
  void addToClassesDisplayed(String item) => classesDisplayed.add(item);
  void removeFromClassesDisplayed(String item) => classesDisplayed.remove(item);
  void removeAtIndexFromClassesDisplayed(int index) =>
      classesDisplayed.removeAt(index);
  void insertAtIndexInClassesDisplayed(int index, String item) =>
      classesDisplayed.insert(index, item);
  void updateClassesDisplayedAtIndex(int index, Function(String) updateFn) =>
      classesDisplayed[index] = updateFn(classesDisplayed[index]);

  String currentFilter = 'My Courses';

  List<String> filters = [
    'My Courses',
    'MTH',
    'CHM',
    'BUS',
    'BIO',
    'NUR',
    'CSC',
    'PHY',
    'EGR',
    'ECN',
    'STA'
  ];
  void addToFilters(String item) => filters.add(item);
  void removeFromFilters(String item) => filters.remove(item);
  void removeAtIndexFromFilters(int index) => filters.removeAt(index);
  void insertAtIndexInFilters(int index, String item) =>
      filters.insert(index, item);
  void updateFiltersAtIndex(int index, Function(String) updateFn) =>
      filters[index] = updateFn(filters[index]);

  String searchText = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
