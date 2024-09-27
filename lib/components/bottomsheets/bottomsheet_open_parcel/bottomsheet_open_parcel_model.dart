import '/components/bottomsheets/handle_bottomsheet/handle_bottomsheet_widget.dart';
import '/components/parcels_components/library_bottomsheet_parcel/library_bottomsheet_parcel_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bottomsheet_open_parcel_widget.dart' show BottomsheetOpenParcelWidget;
import 'package:flutter/material.dart';

class BottomsheetOpenParcelModel
    extends FlutterFlowModel<BottomsheetOpenParcelWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for handleBottomsheet component.
  late HandleBottomsheetModel handleBottomsheetModel;
  // Model for libraryBottomsheetParcel component.
  late LibraryBottomsheetParcelModel libraryBottomsheetParcelModel;

  @override
  void initState(BuildContext context) {
    handleBottomsheetModel =
        createModel(context, () => HandleBottomsheetModel());
    libraryBottomsheetParcelModel =
        createModel(context, () => LibraryBottomsheetParcelModel());
  }

  @override
  void dispose() {
    handleBottomsheetModel.dispose();
    libraryBottomsheetParcelModel.dispose();
  }
}
