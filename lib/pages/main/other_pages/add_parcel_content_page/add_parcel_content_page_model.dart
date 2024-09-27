import '/flutter_flow/flutter_flow_util.dart';
import 'add_parcel_content_page_widget.dart' show AddParcelContentPageWidget;
import 'package:flutter/material.dart';

class AddParcelContentPageModel
    extends FlutterFlowModel<AddParcelContentPageWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading1 = false;
  List<FFUploadedFile> uploadedLocalFiles1 = [];

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextContentTextField widget.
  FocusNode? textContentTextFieldFocusNode;
  TextEditingController? textContentTextFieldTextController;
  String? Function(BuildContext, String?)?
      textContentTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textContentTextFieldFocusNode?.dispose();
    textContentTextFieldTextController?.dispose();
  }
}
