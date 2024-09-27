import '/components/misc/parcel_creator/parcel_creator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'library_parcel_widget.dart' show LibraryParcelWidget;
import 'package:flutter/material.dart';

class LibraryParcelModel extends FlutterFlowModel<LibraryParcelWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for parcelCreator component.
  late ParcelCreatorModel parcelCreatorModel;

  @override
  void initState(BuildContext context) {
    parcelCreatorModel = createModel(context, () => ParcelCreatorModel());
  }

  @override
  void dispose() {
    parcelCreatorModel.dispose();
  }
}
