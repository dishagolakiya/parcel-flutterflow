import '/components/misc/chat_room_tile/chat_room_tile_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'activity_page_widget.dart' show ActivityPageWidget;
import 'package:flutter/material.dart';

class ActivityPageModel extends FlutterFlowModel<ActivityPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for chatRoomTile component.
  late ChatRoomTileModel chatRoomTileModel1;
  // Model for chatRoomTile component.
  late ChatRoomTileModel chatRoomTileModel2;
  // Model for chatRoomTile component.
  late ChatRoomTileModel chatRoomTileModel3;
  // Model for chatRoomTile component.
  late ChatRoomTileModel chatRoomTileModel4;
  // Model for chatRoomTile component.
  late ChatRoomTileModel chatRoomTileModel5;
  // Model for chatRoomTile component.
  late ChatRoomTileModel chatRoomTileModel6;
  // Model for chatRoomTile component.
  late ChatRoomTileModel chatRoomTileModel7;
  // Model for chatRoomTile component.
  late ChatRoomTileModel chatRoomTileModel8;
  // Model for chatRoomTile component.
  late ChatRoomTileModel chatRoomTileModel9;
  // Model for chatRoomTile component.
  late ChatRoomTileModel chatRoomTileModel10;

  @override
  void initState(BuildContext context) {
    chatRoomTileModel1 = createModel(context, () => ChatRoomTileModel());
    chatRoomTileModel2 = createModel(context, () => ChatRoomTileModel());
    chatRoomTileModel3 = createModel(context, () => ChatRoomTileModel());
    chatRoomTileModel4 = createModel(context, () => ChatRoomTileModel());
    chatRoomTileModel5 = createModel(context, () => ChatRoomTileModel());
    chatRoomTileModel6 = createModel(context, () => ChatRoomTileModel());
    chatRoomTileModel7 = createModel(context, () => ChatRoomTileModel());
    chatRoomTileModel8 = createModel(context, () => ChatRoomTileModel());
    chatRoomTileModel9 = createModel(context, () => ChatRoomTileModel());
    chatRoomTileModel10 = createModel(context, () => ChatRoomTileModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    chatRoomTileModel1.dispose();
    chatRoomTileModel2.dispose();
    chatRoomTileModel3.dispose();
    chatRoomTileModel4.dispose();
    chatRoomTileModel5.dispose();
    chatRoomTileModel6.dispose();
    chatRoomTileModel7.dispose();
    chatRoomTileModel8.dispose();
    chatRoomTileModel9.dispose();
    chatRoomTileModel10.dispose();
  }
}
