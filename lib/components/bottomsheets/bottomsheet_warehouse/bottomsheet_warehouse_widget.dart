import '/backend/api_requests/api_calls.dart';
import '/components/bottomsheets/handle_bottomsheet/handle_bottomsheet_widget.dart';
import '/components/parcels_components/explore_parcel/explore_parcel_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottomsheet_warehouse_model.dart';
export 'bottomsheet_warehouse_model.dart';

class BottomsheetWarehouseWidget extends StatefulWidget {
  const BottomsheetWarehouseWidget({
    super.key,
    this.parcel,
  });

  final dynamic parcel;

  @override
  State<BottomsheetWarehouseWidget> createState() =>
      _BottomsheetWarehouseWidgetState();
}

class _BottomsheetWarehouseWidgetState
    extends State<BottomsheetWarehouseWidget> {
  late BottomsheetWarehouseModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomsheetWarehouseModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          wrapWithModel(
            model: _model.handleBottomsheetModel,
            updateCallback: () => safeSetState(() {}),
            child: const HandleBottomsheetWidget(),
          ),
          wrapWithModel(
            model: _model.exploreParcelModel,
            updateCallback: () => safeSetState(() {}),
            child: ExploreParcelWidget(
              title: getJsonField(
                widget.parcel,
                r'''$.parcel.parcel.title''',
              ).toString(),
              description: getJsonField(
                widget.parcel,
                r'''$.parcel.parcel.description''',
              ).toString(),
              daysToUnlock: getJsonField(
                widget.parcel,
                r'''$.parcel.parcel.days_to_unlock''',
              ),
              starRating: getJsonField(
                widget.parcel,
                r'''$.parcel.parcel.ratings_count''',
              ),
              userCount: getJsonField(
                widget.parcel,
                r'''$.parcel.parcel.unique_users_count''',
              ).toString(),
              imageUrl: getJsonField(
                widget.parcel,
                r'''$.parcel.parcel.parcel_image''',
              ).toString(),
              userDpUrl: getJsonField(
                widget.parcel,
                r'''$.parcel.parcel.user.profile_pic''',
              ).toString(),
              username: getJsonField(
                widget.parcel,
                r'''$.parcel.parcel.user.username''',
              ).toString(),
              userId: getJsonField(
                widget.parcel,
                r'''$.parcel.parcel.user.user''',
              ).toString(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    _model.addParcelToLibraryapiResult =
                        await AddParcelToLibraryCall.call(
                      authToken: FFAppState().accessToken,
                      parcel: getJsonField(
                        widget.parcel,
                        r'''$.parcel.parcel.id''',
                      ).toString(),
                    );

                    if ((_model.addParcelToLibraryapiResult?.succeeded ??
                        true)) {
                      context.goNamed('LibraryPage');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            getJsonField(
                              (_model.addParcelToLibraryapiResult?.jsonBody ??
                                  ''),
                              r'''$.detail''',
                            ).toString(),
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                    }

                    safeSetState(() {});
                  },
                  text: 'Deliver to library',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    context.goNamed('TextParcel');
                  },
                  text: 'Open parcel',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
