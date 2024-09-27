import '/components/bottomsheets/handle_bottomsheet/handle_bottomsheet_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bottomsheet_comments_widget.dart' show BottomsheetCommentsWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class BottomsheetCommentsModel
    extends FlutterFlowModel<BottomsheetCommentsWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for handleBottomsheet component.
  late HandleBottomsheetModel handleBottomsheetModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    handleBottomsheetModel =
        createModel(context, () => HandleBottomsheetModel());
  }

  @override
  void dispose() {
    handleBottomsheetModel.dispose();
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
