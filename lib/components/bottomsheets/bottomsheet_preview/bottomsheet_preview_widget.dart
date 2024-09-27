import '/backend/api_requests/api_calls.dart';
import '/components/bottomsheets/handle_bottomsheet/handle_bottomsheet_widget.dart';
import '/components/parcels_components/preview_parcel/preview_parcel_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottomsheet_preview_model.dart';
export 'bottomsheet_preview_model.dart';

class BottomsheetPreviewWidget extends StatefulWidget {
  const BottomsheetPreviewWidget({
    super.key,
    String? title,
    required this.description,
    required this.daysToUnlock,
    required this.contentType,
    required this.parcelImage,
    this.imageContentFiles,
    this.audioContentFiles,
    this.fileContentFiles,
    this.textContent,
  }) : title = title ?? 'Title';

  final String title;
  final String? description;
  final int? daysToUnlock;
  final String? contentType;
  final FFUploadedFile? parcelImage;
  final List<FFUploadedFile>? imageContentFiles;
  final FFUploadedFile? audioContentFiles;
  final FFUploadedFile? fileContentFiles;
  final String? textContent;

  @override
  State<BottomsheetPreviewWidget> createState() =>
      _BottomsheetPreviewWidgetState();
}

class _BottomsheetPreviewWidgetState extends State<BottomsheetPreviewWidget> {
  late BottomsheetPreviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomsheetPreviewModel());
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
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
            child: Text(
              'Preview',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: FlutterFlowTheme.of(context).textOverImage,
                    fontSize: 25.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w300,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
            ),
          ),
          wrapWithModel(
            model: _model.previewParcelModel,
            updateCallback: () => safeSetState(() {}),
            child: PreviewParcelWidget(
              title: widget.title,
              description: widget.description!,
              daysToUnlock: widget.daysToUnlock!,
              starRating: 4.2,
              userCount: '1.2k',
              parcelIcon: widget.parcelImage!,
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
                      'Create parcel?',
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
                            var shouldSetState = false;
                            if (widget.contentType == 'Image') {
                              _model.createImageParcelAPIResponse =
                                  await CreateImageParcelCall.call(
                                authToken: FFAppState().accessToken,
                                contentType: 'image',
                                daysToUnlock: widget.daysToUnlock,
                                title: widget.title,
                                description: widget.description,
                                parcelImage: widget.parcelImage,
                                contentFilesList: widget.imageContentFiles,
                              );

                              shouldSetState = true;
                              if ((_model.createImageParcelAPIResponse
                                      ?.succeeded ??
                                  true)) {
                                context.pushNamed('ProfilePage');

                                if (shouldSetState) safeSetState(() {});
                                return;
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      (_model.createImageParcelAPIResponse
                                                  ?.jsonBody ??
                                              '')
                                          .toString(),
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                                if (shouldSetState) safeSetState(() {});
                                return;
                              }
                            } else if (widget.contentType == 'File') {
                              _model.createFileParcelAPIResponse =
                                  await CreateOtherParcelCall.call(
                                authToken: FFAppState().accessToken,
                                contentType: 'file',
                                daysToUnlock: widget.daysToUnlock,
                                title: widget.title,
                                description: widget.description,
                                parcelImage: widget.parcelImage,
                                contentFiles: widget.fileContentFiles,
                              );

                              shouldSetState = true;
                              if ((_model
                                      .createFileParcelAPIResponse?.succeeded ??
                                  true)) {
                                context.pushNamed('ProfilePage');

                                if (shouldSetState) safeSetState(() {});
                                return;
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      (_model.createFileParcelAPIResponse
                                                  ?.jsonBody ??
                                              '')
                                          .toString(),
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                                if (shouldSetState) safeSetState(() {});
                                return;
                              }
                            } else if (widget.contentType == 'Audio') {
                              _model.createAudioParcelAPIResponse =
                                  await CreateOtherParcelCall.call(
                                authToken: FFAppState().accessToken,
                                contentType: 'audio',
                                daysToUnlock: widget.daysToUnlock,
                                title: widget.title,
                                description: widget.description,
                                parcelImage: widget.parcelImage,
                                contentFiles: widget.audioContentFiles,
                              );

                              shouldSetState = true;
                              if ((_model.createAudioParcelAPIResponse
                                      ?.succeeded ??
                                  true)) {
                                context.pushNamed('ProfilePage');

                                if (shouldSetState) safeSetState(() {});
                                return;
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      (_model.createAudioParcelAPIResponse
                                                  ?.jsonBody ??
                                              '')
                                          .toString(),
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                                if (shouldSetState) safeSetState(() {});
                                return;
                              }
                            } else {
                              _model.createTextParcelAPIResponse =
                                  await CreateOtherParcelCall.call(
                                authToken: FFAppState().accessToken,
                                contentType: 'text',
                                daysToUnlock: widget.daysToUnlock,
                                title: widget.title,
                                description: widget.description,
                                parcelImage: widget.parcelImage,
                                contentText: widget.textContent,
                              );

                              shouldSetState = true;
                              if ((_model
                                      .createTextParcelAPIResponse?.succeeded ??
                                  true)) {
                                context.pushNamed('ProfilePage');

                                if (shouldSetState) safeSetState(() {});
                                return;
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      (_model.createTextParcelAPIResponse
                                                  ?.jsonBody ??
                                              '')
                                          .toString(),
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                                if (shouldSetState) safeSetState(() {});
                                return;
                              }
                            }

                            if (shouldSetState) safeSetState(() {});
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
                              color: Colors.transparent,
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
