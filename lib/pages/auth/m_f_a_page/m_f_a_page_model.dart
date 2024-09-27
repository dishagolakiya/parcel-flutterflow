import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'm_f_a_page_widget.dart' show MFAPageWidget;
import 'package:flutter/material.dart';

class MFAPageModel extends FlutterFlowModel<MFAPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Backend Call - API (Resend OTP)] action in Text widget.
  ApiCallResponse? resendOTPAPIResult;
  // Stores action output result for [Backend Call - API (Verify OTP)] action in Button widget.
  ApiCallResponse? verifyOTPAPIResult;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }
}
