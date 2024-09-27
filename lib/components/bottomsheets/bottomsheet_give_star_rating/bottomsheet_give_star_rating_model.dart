import '/components/bottomsheets/handle_bottomsheet/handle_bottomsheet_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bottomsheet_give_star_rating_widget.dart'
    show BottomsheetGiveStarRatingWidget;
import 'package:flutter/material.dart';

class BottomsheetGiveStarRatingModel
    extends FlutterFlowModel<BottomsheetGiveStarRatingWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for handleBottomsheet component.
  late HandleBottomsheetModel handleBottomsheetModel;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;

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
