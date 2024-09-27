import '/backend/api_requests/api_calls.dart';
import '/components/bottomsheets/handle_bottomsheet/handle_bottomsheet_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'view_folder_bottomsheet_widget.dart' show ViewFolderBottomsheetWidget;
import 'package:flutter/material.dart';

class ViewFolderBottomsheetModel
    extends FlutterFlowModel<ViewFolderBottomsheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for handleBottomsheet component.
  late HandleBottomsheetModel handleBottomsheetModel;
  // Stores action output result for [Backend Call - API (Add parcel to folder)] action in FolderImageGrid widget.
  ApiCallResponse? addParcelToFolderapiResul;

  @override
  void initState(BuildContext context) {
    handleBottomsheetModel =
        createModel(context, () => HandleBottomsheetModel());
  }

  @override
  void dispose() {
    handleBottomsheetModel.dispose();
  }
}
