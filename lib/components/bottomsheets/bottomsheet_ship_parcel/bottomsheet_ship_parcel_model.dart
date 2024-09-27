import '/components/bottomsheets/handle_bottomsheet/handle_bottomsheet_widget.dart';
import '/components/parcels_components/explore_parcel/explore_parcel_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bottomsheet_ship_parcel_widget.dart' show BottomsheetShipParcelWidget;
import 'package:flutter/material.dart';

class BottomsheetShipParcelModel
    extends FlutterFlowModel<BottomsheetShipParcelWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for handleBottomsheet component.
  late HandleBottomsheetModel handleBottomsheetModel;
  // Model for exploreParcel component.
  late ExploreParcelModel exploreParcelModel;

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
