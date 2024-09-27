import '/components/misc/follower_row/follower_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_list_page_widget.dart' show UserListPageWidget;
import 'package:flutter/material.dart';

class UserListPageModel extends FlutterFlowModel<UserListPageWidget> {
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
  // Model for followerRow component.
  late FollowerRowModel followerRowModel9;
  // Model for followerRow component.
  late FollowerRowModel followerRowModel10;
  // Model for followerRow component.
  late FollowerRowModel followerRowModel11;
  // Model for followerRow component.
  late FollowerRowModel followerRowModel12;
  // Model for followerRow component.
  late FollowerRowModel followerRowModel13;
  // Model for followerRow component.
  late FollowerRowModel followerRowModel14;

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
    followerRowModel9 = createModel(context, () => FollowerRowModel());
    followerRowModel10 = createModel(context, () => FollowerRowModel());
    followerRowModel11 = createModel(context, () => FollowerRowModel());
    followerRowModel12 = createModel(context, () => FollowerRowModel());
    followerRowModel13 = createModel(context, () => FollowerRowModel());
    followerRowModel14 = createModel(context, () => FollowerRowModel());
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
    followerRowModel9.dispose();
    followerRowModel10.dispose();
    followerRowModel11.dispose();
    followerRowModel12.dispose();
    followerRowModel13.dispose();
    followerRowModel14.dispose();
  }
}
