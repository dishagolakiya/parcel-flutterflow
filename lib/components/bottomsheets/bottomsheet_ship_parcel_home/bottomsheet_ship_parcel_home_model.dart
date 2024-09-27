import '/backend/api_requests/api_calls.dart';
import '/components/bottomsheets/handle_bottomsheet/handle_bottomsheet_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bottomsheet_ship_parcel_home_widget.dart'
    show BottomsheetShipParcelHomeWidget;
import 'package:flutter/material.dart';

class BottomsheetShipParcelHomeModel
    extends FlutterFlowModel<BottomsheetShipParcelHomeWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for handleBottomsheet component.
  late HandleBottomsheetModel handleBottomsheetModel;
  // Stores action output result for [Backend Call - API (Ship parcel to Warehouse)] action in Button widget.
  ApiCallResponse? shipParcelapiResult;

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
