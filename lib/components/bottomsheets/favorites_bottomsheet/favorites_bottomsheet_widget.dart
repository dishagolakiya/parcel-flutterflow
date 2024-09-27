import '/components/parcels_components/explore_parcel/explore_parcel_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'favorites_bottomsheet_model.dart';
export 'favorites_bottomsheet_model.dart';

class FavoritesBottomsheetWidget extends StatefulWidget {
  const FavoritesBottomsheetWidget({super.key});

  @override
  State<FavoritesBottomsheetWidget> createState() =>
      _FavoritesBottomsheetWidgetState();
}

class _FavoritesBottomsheetWidgetState
    extends State<FavoritesBottomsheetWidget> {
  late FavoritesBottomsheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoritesBottomsheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Favorites',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).textOverImage,
                          fontSize: 25.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
              ),
              FlutterFlowIconButton(
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 44.0,
                icon: Icon(
                  Icons.close_sharp,
                  color: FlutterFlowTheme.of(context).textOverImage,
                  size: 24.0,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1.0,
          indent: 25.0,
          endIndent: 25.0,
          color: FlutterFlowTheme.of(context).textOverImage,
        ),
        Flexible(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(
              0,
              20.0,
              0,
              20.0,
            ),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              wrapWithModel(
                model: _model.exploreParcelModel1,
                updateCallback: () => safeSetState(() {}),
                child: const ExploreParcelWidget(),
              ),
              wrapWithModel(
                model: _model.exploreParcelModel2,
                updateCallback: () => safeSetState(() {}),
                child: const ExploreParcelWidget(),
              ),
            ].divide(const SizedBox(height: 20.0)),
          ),
        ),
      ],
    );
  }
}
