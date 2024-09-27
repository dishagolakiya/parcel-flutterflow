import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_parcel_page_widget.dart' show CreateParcelPageWidget;
import 'package:flutter/material.dart';

class CreateParcelPageModel extends FlutterFlowModel<CreateParcelPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TitleTextField widget.
  FocusNode? titleTextFieldFocusNode;
  TextEditingController? titleTextFieldTextController;
  String? Function(BuildContext, String?)?
      titleTextFieldTextControllerValidator;
  String? _titleTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 5) {
      return 'Atleast 5 characters required for title!';
    }
    if (val.length > 50) {
      return 'More than 50 characters not allowed for title!';
    }

    return null;
  }

  // State field(s) for ContentTypeChoiceChips widget.
  FormFieldController<List<String>>? contentTypeChoiceChipsValueController;
  String? get contentTypeChoiceChipsValue =>
      contentTypeChoiceChipsValueController?.value?.firstOrNull;
  set contentTypeChoiceChipsValue(String? val) =>
      contentTypeChoiceChipsValueController?.value = val != null ? [val] : [];
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for DescriptionTextField widget.
  FocusNode? descriptionTextFieldFocusNode;
  TextEditingController? descriptionTextFieldTextController;
  String? Function(BuildContext, String?)?
      descriptionTextFieldTextControllerValidator;
  String? _descriptionTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 20) {
      return 'Atleast 20 characters required for title!';
    }
    if (val.length > 250) {
      return 'More than 250 characters not allowed for title!';
    }

    return null;
  }

  // State field(s) for DaysToUnlockCountController widget.
  int? daysToUnlockCountControllerValue;

  @override
  void initState(BuildContext context) {
    titleTextFieldTextControllerValidator =
        _titleTextFieldTextControllerValidator;
    descriptionTextFieldTextControllerValidator =
        _descriptionTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    titleTextFieldFocusNode?.dispose();
    titleTextFieldTextController?.dispose();

    descriptionTextFieldFocusNode?.dispose();
    descriptionTextFieldTextController?.dispose();
  }
}
