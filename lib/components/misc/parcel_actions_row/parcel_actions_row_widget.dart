import '/components/bottomsheets/bottomsheet_give_star_rating/bottomsheet_give_star_rating_widget.dart';
import '/components/bottomsheets/view_folder_bottomsheet/view_folder_bottomsheet_widget.dart';
import '/components/comments_components/bottomsheet_comments/bottomsheet_comments_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'parcel_actions_row_model.dart';
export 'parcel_actions_row_model.dart';

class ParcelActionsRowWidget extends StatefulWidget {
  const ParcelActionsRowWidget({super.key});

  @override
  State<ParcelActionsRowWidget> createState() => _ParcelActionsRowWidgetState();
}

class _ParcelActionsRowWidgetState extends State<ParcelActionsRowWidget> {
  late ParcelActionsRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ParcelActionsRowModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlutterFlowIconButton(
          borderRadius: 20.0,
          borderWidth: 1.0,
          buttonSize: 40.0,
          icon: Icon(
            Icons.star_border_outlined,
            color: FlutterFlowTheme.of(context).accent1,
            size: 26.0,
          ),
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: const BottomsheetGiveStarRatingWidget(),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
        ),
        FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 20.0,
          borderWidth: 1.0,
          buttonSize: 40.0,
          icon: Icon(
            Icons.comment_outlined,
            color: FlutterFlowTheme.of(context).accent1,
            size: 22.0,
          ),
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: const BottomsheetCommentsWidget(),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
        ),
        FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 20.0,
          borderWidth: 1.0,
          buttonSize: 40.0,
          icon: Icon(
            Icons.folder_open_outlined,
            color: FlutterFlowTheme.of(context).accent1,
            size: 24.0,
          ),
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.7,
                    child: const ViewFolderBottomsheetWidget(),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
        ),
      ],
    );
  }
}
