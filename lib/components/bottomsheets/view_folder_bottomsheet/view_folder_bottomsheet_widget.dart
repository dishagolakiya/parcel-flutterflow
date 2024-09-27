import '/backend/api_requests/api_calls.dart';
import '/components/bottomsheets/handle_bottomsheet/handle_bottomsheet_widget.dart';
import '/components/misc/folder_image_grid/folder_image_grid_widget.dart';
import '/components/misc/no_data_component/no_data_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'view_folder_bottomsheet_model.dart';
export 'view_folder_bottomsheet_model.dart';

class ViewFolderBottomsheetWidget extends StatefulWidget {
  const ViewFolderBottomsheetWidget({
    super.key,
    this.parcelId,
  });

  final String? parcelId;

  @override
  State<ViewFolderBottomsheetWidget> createState() =>
      _ViewFolderBottomsheetWidgetState();
}

class _ViewFolderBottomsheetWidgetState
    extends State<ViewFolderBottomsheetWidget> {
  late ViewFolderBottomsheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewFolderBottomsheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: FutureBuilder<ApiCallResponse>(
        future: GetAllFoldersCall.call(
          authToken: FFAppState().accessToken,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          final containerGetAllFoldersResponse = snapshot.data!;

          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBottomsheet,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  wrapWithModel(
                    model: _model.handleBottomsheetModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const HandleBottomsheetWidget(),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                    child: Text(
                      'Folders',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 17.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                    child: Text(
                      'Select folder where you want to add this parcel',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w200,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final folders =
                            containerGetAllFoldersResponse.jsonBody.toList();
                        if (folders.isEmpty) {
                          return const Center(
                            child: NoDataComponentWidget(
                              messageText: 'No folders are created!',
                            ),
                          );
                        }

                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 0.8,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: folders.length,
                          itemBuilder: (context, foldersIndex) {
                            final foldersItem = folders[foldersIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.addParcelToFolderapiResul =
                                    await AddParcelToFolderCall.call(
                                  folderId: getJsonField(
                                    foldersItem,
                                    r'''$.id''',
                                  ).toString(),
                                  authToken: FFAppState().accessToken,
                                  parcelId: widget.parcelId,
                                );

                                if ((_model
                                        .addParcelToFolderapiResul?.succeeded ??
                                    true)) {
                                  Navigator.pop(context);

                                  context.pushNamed(
                                    'FolderPage',
                                    queryParameters: {
                                      'folderId': serializeParam(
                                        getJsonField(
                                          foldersItem,
                                          r'''$.id''',
                                        ).toString(),
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        getJsonField(
                                          (_model.addParcelToFolderapiResul
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.detail''',
                                        ).toString(),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                }

                                safeSetState(() {});
                              },
                              child: FolderImageGridWidget(
                                key: Key(
                                    'Keyi0s_${foldersIndex}_of_${folders.length}'),
                                folderObj: foldersItem,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
