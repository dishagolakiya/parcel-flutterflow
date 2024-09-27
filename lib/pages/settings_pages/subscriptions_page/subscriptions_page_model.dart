import '/components/misc/follower_row/follower_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'subscriptions_page_widget.dart' show SubscriptionsPageWidget;
import 'package:flutter/material.dart';

class SubscriptionsPageModel extends FlutterFlowModel<SubscriptionsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for followerRow component.
  late FollowerRowModel followerRowModel1;
  // Model for followerRow component.
  late FollowerRowModel followerRowModel2;
  // Model for followerRow component.
  late FollowerRowModel followerRowModel3;
  // Model for followerRow component.
  late FollowerRowModel followerRowModel4;
  // Model for followerRow component.
  late FollowerRowModel followerRowModel5;
  // Model for followerRow component.
  late FollowerRowModel followerRowModel6;
  // Model for followerRow component.
  late FollowerRowModel followerRowModel7;
  // Model for followerRow component.
  late FollowerRowModel followerRowModel8;

  @override
  void initState(BuildContext context) {
    followerRowModel1 = createModel(context, () => FollowerRowModel());
    followerRowModel2 = createModel(context, () => FollowerRowModel());
    followerRowModel3 = createModel(context, () => FollowerRowModel());
    followerRowModel4 = createModel(context, () => FollowerRowModel());
    followerRowModel5 = createModel(context, () => FollowerRowModel());
    followerRowModel6 = createModel(context, () => FollowerRowModel());
    followerRowModel7 = createModel(context, () => FollowerRowModel());
    followerRowModel8 = createModel(context, () => FollowerRowModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    followerRowModel1.dispose();
    followerRowModel2.dispose();
    followerRowModel3.dispose();
    followerRowModel4.dispose();
    followerRowModel5.dispose();
    followerRowModel6.dispose();
    followerRowModel7.dispose();
    followerRowModel8.dispose();
  }
}
