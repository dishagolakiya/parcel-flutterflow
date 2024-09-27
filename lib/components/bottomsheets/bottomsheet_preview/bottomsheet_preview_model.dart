import '/backend/api_requests/api_calls.dart';
import '/components/bottomsheets/handle_bottomsheet/handle_bottomsheet_widget.dart';
import '/components/parcels_components/preview_parcel/preview_parcel_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bottomsheet_preview_widget.dart' show BottomsheetPreviewWidget;
import 'package:flutter/material.dart';

class BottomsheetPreviewModel
    extends FlutterFlowModel<BottomsheetPreviewWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for handleBottomsheet component.
  late HandleBottomsheetModel handleBottomsheetModel;
  // Model for previewParcel component.
  late PreviewParcelModel previewParcelModel;
  // Stores action output result for [Backend Call - API (Create Image Parcel)] action in Button widget.
  ApiCallResponse? createImageParcelAPIResponse;
  // Stores action output result for [Backend Call - API (Create other Parcel)] action in Button widget.
  ApiCallResponse? createFileParcelAPIResponse;
  // Stores action output result for [Backend Call - API (Create other Parcel)] action in Button widget.
  ApiCallResponse? createAudioParcelAPIResponse;
  // Stores action output result for [Backend Call - API (Create other Parcel)] action in Button widget.
  ApiCallResponse? createTextParcelAPIResponse;

  @override
  void initState(BuildContext context) {
    handleBottomsheetModel =
        createModel(context, () => HandleBottomsheetModel());
    previewParcelModel = createModel(context, () => PreviewParcelModel());
  }

  @override
  void dispose() {
    handleBottomsheetModel.dispose();
    previewParcelModel.dispose();
  }
}
