import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_edit_folder_page_widget.dart' show CreateEditFolderPageWidget;
import 'package:flutter/material.dart';

class CreateEditFolderPageModel
    extends FlutterFlowModel<CreateEditFolderPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Edit Library Folder)] action in Button widget.
  ApiCallResponse? editFolderapiResult;
  // Stores action output result for [Backend Call - API (Create Library Folder)] action in Button widget.
  ApiCallResponse? createFolderapiResul;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
