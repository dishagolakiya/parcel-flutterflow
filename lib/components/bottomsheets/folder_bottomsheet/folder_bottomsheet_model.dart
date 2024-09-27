import '/backend/api_requests/api_calls.dart';
import '/components/bottomsheets/handle_bottomsheet/handle_bottomsheet_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'folder_bottomsheet_widget.dart' show FolderBottomsheetWidget;
import 'package:flutter/material.dart';

class FolderBottomsheetModel extends FlutterFlowModel<FolderBottomsheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for handleBottomsheet component.
  late HandleBottomsheetModel handleBottomsheetModel;
  // Stores action output result for [Backend Call - API (Remove parcel from folder)] action in Button widget.
  ApiCallResponse? removeParcelapiResult;

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
