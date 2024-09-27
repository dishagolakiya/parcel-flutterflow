import '/components/bottomsheets/handle_bottomsheet/handle_bottomsheet_widget.dart';
import '/components/parcels_components/library_bottomsheet_parcel/library_bottomsheet_parcel_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bottomsheet_open_parcel_model.dart';
export 'bottomsheet_open_parcel_model.dart';

class BottomsheetOpenParcelWidget extends StatefulWidget {
  const BottomsheetOpenParcelWidget({
    super.key,
    this.parcelObj,
    this.contentType,
  });

  final dynamic parcelObj;
  final String? contentType;

  @override
  State<BottomsheetOpenParcelWidget> createState() =>
      _BottomsheetOpenParcelWidgetState();
}

class _BottomsheetOpenParcelWidgetState
    extends State<BottomsheetOpenParcelWidget> {
  late BottomsheetOpenParcelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomsheetOpenParcelModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            model: _model.libraryBottomsheetParcelModel,
            updateCallback: () => safeSetState(() {}),
            child: LibraryBottomsheetParcelWidget(
              parcelImage: getJsonField(
                widget.parcelObj,
                r'''$.parcel_image''',
              ).toString(),
              title: getJsonField(
                widget.parcelObj,
                r'''$.title''',
              ).toString(),
              description: getJsonField(
                widget.parcelObj,
                r'''$.description''',
              ).toString(),
              starRating: getJsonField(
                widget.parcelObj,
                r'''$.ratings_count''',
              ),
              userCount: getJsonField(
                widget.parcelObj,
                r'''$.unique_users_count''',
              ).toString(),
              userDpUrl: getJsonField(
                widget.parcelObj,
                r'''$.user.profile_pic''',
              ).toString(),
              username: getJsonField(
                widget.parcelObj,
                r'''$.user.username''',
              ).toString(),
              userId: getJsonField(
                widget.parcelObj,
                r'''$.user.user''',
              ).toString(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 7.0),
                    child: Text(
                      'Open parcel?',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w300,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'No',
                          options: FFButtonOptions(
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: FlutterFlowTheme.of(context).error,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 0.0,
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(25.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (widget.contentType == 'image') {
                              context.pushNamed(
                                'ImageParcel',
                                queryParameters: {
                                  'parcelId': serializeParam(
                                    getJsonField(
                                      widget.parcelObj,
                                      r'''$.id''',
                                    ).toString(),
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            } else if (widget.contentType == 'file') {
                              context.pushNamed(
                                'FileParcel',
                                queryParameters: {
                                  'parcelId': serializeParam(
                                    getJsonField(
                                      widget.parcelObj,
                                      r'''$.id''',
                                    ).toString(),
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            } else if (widget.contentType == 'audio') {
                              context.pushNamed(
                                'AudioParcel',
                                queryParameters: {
                                  'parcelId': serializeParam(
                                    getJsonField(
                                      widget.parcelObj,
                                      r'''$.id''',
                                    ).toString(),
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            } else {
                              context.pushNamed(
                                'TextParcel',
                                queryParameters: {
                                  'parcelId': serializeParam(
                                    getJsonField(
                                      widget.parcelObj,
                                      r'''$.id''',
                                    ).toString(),
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            }
                          },
                          text: 'Yes',
                          options: FFButtonOptions(
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: FlutterFlowTheme.of(context).success,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              width: 0.0,
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(25.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
