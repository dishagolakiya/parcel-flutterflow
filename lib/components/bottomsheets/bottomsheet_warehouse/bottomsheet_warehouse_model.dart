import '/backend/api_requests/api_calls.dart';
import '/components/bottomsheets/handle_bottomsheet/handle_bottomsheet_widget.dart';
import '/components/parcels_components/explore_parcel/explore_parcel_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bottomsheet_warehouse_widget.dart' show BottomsheetWarehouseWidget;
import 'package:flutter/material.dart';

class BottomsheetWarehouseModel
    extends FlutterFlowModel<BottomsheetWarehouseWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for handleBottomsheet component.
  late HandleBottomsheetModel handleBottomsheetModel;
  // Model for exploreParcel component.
  late ExploreParcelModel exploreParcelModel;
  // Stores action output result for [Backend Call - API (Add parcel to Library)] action in Button widget.
  ApiCallResponse? addParcelToLibraryapiResult;

  @override
  void initState(BuildContext context) {
    handleBottomsheetModel =
        createModel(context, () => HandleBottomsheetModel());
    exploreParcelModel = createModel(context, () => ExploreParcelModel());
  }

  @override
  void dispose() {
    handleBottomsheetModel.dispose();
    exploreParcelModel.dispose();
  }
}
