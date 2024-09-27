import '/components/parcels_components/explore_parcel/explore_parcel_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'favorites_bottomsheet_widget.dart' show FavoritesBottomsheetWidget;
import 'package:flutter/material.dart';

class FavoritesBottomsheetModel
    extends FlutterFlowModel<FavoritesBottomsheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for exploreParcel component.
  late ExploreParcelModel exploreParcelModel1;
  // Model for exploreParcel component.
  late ExploreParcelModel exploreParcelModel2;

  @override
  void initState(BuildContext context) {
    exploreParcelModel1 = createModel(context, () => ExploreParcelModel());
    exploreParcelModel2 = createModel(context, () => ExploreParcelModel());
  }

  @override
  void dispose() {
    exploreParcelModel1.dispose();
    exploreParcelModel2.dispose();
  }
}
