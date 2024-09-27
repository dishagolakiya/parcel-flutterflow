import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'user_star_score_model.dart';
export 'user_star_score_model.dart';

class UserStarScoreWidget extends StatefulWidget {
  const UserStarScoreWidget({
    super.key,
    this.starScore,
  });

  final int? starScore;

  @override
  State<UserStarScoreWidget> createState() => _UserStarScoreWidgetState();
}

class _UserStarScoreWidgetState extends State<UserStarScoreWidget> {
  late UserStarScoreModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserStarScoreModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star,
            color: FlutterFlowTheme.of(context).starRating,
            size: 24.0,
          ),
          Text(
            valueOrDefault<String>(
              widget.starScore?.toString(),
              '1',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
          ),
          Icon(
            Icons.star,
            color: FlutterFlowTheme.of(context).starRating,
            size: 24.0,
          ),
        ].divide(const SizedBox(width: 5.0)),
      ),
    );
  }
}
