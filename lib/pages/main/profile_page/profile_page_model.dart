import '/components/misc/user_star_score/user_star_score_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for userStarScore component.
  late UserStarScoreModel userStarScoreModel;

  @override
  void initState(BuildContext context) {
    userStarScoreModel = createModel(context, () => UserStarScoreModel());
  }

  @override
  void dispose() {
    userStarScoreModel.dispose();
  }
}
