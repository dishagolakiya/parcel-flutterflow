import '/components/parcels_components/search_parcel/search_parcel_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_page_widget.dart' show SearchPageWidget;
import 'package:flutter/material.dart';

class SearchPageModel extends FlutterFlowModel<SearchPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for searchParcel component.
  late SearchParcelModel searchParcelModel1;
  // Model for searchParcel component.
  late SearchParcelModel searchParcelModel2;
  // Model for searchParcel component.
  late SearchParcelModel searchParcelModel3;
  // Model for searchParcel component.
  late SearchParcelModel searchParcelModel4;
  // Model for searchParcel component.
  late SearchParcelModel searchParcelModel5;
  // Model for searchParcel component.
  late SearchParcelModel searchParcelModel6;
  // Model for searchParcel component.
  late SearchParcelModel searchParcelModel7;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    searchParcelModel1 = createModel(context, () => SearchParcelModel());
    searchParcelModel2 = createModel(context, () => SearchParcelModel());
    searchParcelModel3 = createModel(context, () => SearchParcelModel());
    searchParcelModel4 = createModel(context, () => SearchParcelModel());
    searchParcelModel5 = createModel(context, () => SearchParcelModel());
    searchParcelModel6 = createModel(context, () => SearchParcelModel());
    searchParcelModel7 = createModel(context, () => SearchParcelModel());
  }

  @override
  void dispose() {
    searchParcelModel1.dispose();
    searchParcelModel2.dispose();
    searchParcelModel3.dispose();
    searchParcelModel4.dispose();
    searchParcelModel5.dispose();
    searchParcelModel6.dispose();
    searchParcelModel7.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
