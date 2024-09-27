import '/backend/api_requests/api_calls.dart';
import '/components/bin/warehouse_locked_spot/warehouse_locked_spot_widget.dart';
import '/components/bottomsheets/bottomsheet_warehouse/bottomsheet_warehouse_widget.dart';
import '/components/misc/warehouse_add_parcel/warehouse_add_parcel_widget.dart';
import '/components/parcels_components/warehouse_parcel/warehouse_parcel_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'warehouse_page_model.dart';
export 'warehouse_page_model.dart';

class WarehousePageWidget extends StatefulWidget {
  const WarehousePageWidget({super.key});

  @override
  State<WarehousePageWidget> createState() => _WarehousePageWidgetState();
}

class _WarehousePageWidgetState extends State<WarehousePageWidget> {
  late WarehousePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WarehousePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: GetWarehouseCall.call(
        authToken: FFAppState().accessToken,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final warehousePageGetWarehouseResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  'Warehouse',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineMediumFamily,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 30.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineMediumFamily),
                      ),
                ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final spots = GetWarehouseCall.spots(
                                warehousePageGetWarehouseResponse.jsonBody,
                              )?.toList() ??
                              [];

                          return GridView.builder(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              10.0,
                              0,
                              0,
                            ),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 0.75,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: spots.length,
                            itemBuilder: (context, spotsIndex) {
                              final spotsItem = spots[spotsIndex];
                              return Builder(
                                builder: (context) {
                                  if (!getJsonField(
                                        spotsItem,
                                        r'''$.locked''',
                                      ) &&
                                      !getJsonField(
                                        spotsItem,
                                        r'''$.spot_empty''',
                                      )) {
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (getJsonField(
                                          spotsItem,
                                          r'''$.parcel.active''',
                                        )) {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () =>
                                                    FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      BottomsheetWarehouseWidget(
                                                    parcel: spotsItem,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        } else {
                                          _model.clickPareclapiResult =
                                              await ClickParcelCall.call(
                                            warehouseParcelId: getJsonField(
                                              spotsItem,
                                              r'''$.parcel.id''',
                                            ),
                                            authToken: FFAppState().accessToken,
                                          );

                                          if ((_model.clickPareclapiResult
                                                  ?.succeeded ??
                                              true)) {
                                            context.pushNamed('WarehousePage');
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  getJsonField(
                                                    (_model.clickPareclapiResult
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.detail''',
                                                  ).toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent4,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 6000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                              ),
                                            );
                                          }
                                        }

                                        safeSetState(() {});
                                      },
                                      child: WarehouseParcelWidget(
                                        key: Key(
                                            'Keyvqi_${spotsIndex}_of_${spots.length}'),
                                        imageUrl: valueOrDefault<String>(
                                          getJsonField(
                                            spotsItem,
                                            r'''$.parcel.parcel.parcel_image''',
                                          )?.toString(),
                                          'https://parcelcontent.s3.amazonaws.com/static/profile_pic_placeholder.jpg',
                                        ),
                                        daysClicked: valueOrDefault<int>(
                                          getJsonField(
                                            spotsItem,
                                            r'''$.click_count''',
                                          ),
                                          1,
                                        ),
                                        daysToUnlock: valueOrDefault<int>(
                                          getJsonField(
                                            spotsItem,
                                            r'''$.days_to_unlock''',
                                          ),
                                          2,
                                        ),
                                        title: valueOrDefault<String>(
                                          getJsonField(
                                            spotsItem,
                                            r'''$.parcel.parcel.title''',
                                          )?.toString(),
                                          'Title',
                                        ),
                                        countProgress: valueOrDefault<double>(
                                          getJsonField(
                                            spotsItem,
                                            r'''$.count_progress''',
                                          ),
                                          0.5,
                                        ),
                                        isActive: getJsonField(
                                          spotsItem,
                                          r'''$.parcel.active''',
                                        ),
                                        userDpUrl: getJsonField(
                                          spotsItem,
                                          r'''$.parcel.parcel.user.profile_pic''',
                                        ).toString(),
                                        username: getJsonField(
                                          spotsItem,
                                          r'''$.parcel.parcel.user.username''',
                                        ).toString(),
                                        userId: getJsonField(
                                          spotsItem,
                                          r'''$.parcel.parcel.user.user''',
                                        ).toString(),
                                      ),
                                    );
                                  } else if (!getJsonField(
                                        spotsItem,
                                        r'''$.locked''',
                                      ) &&
                                      getJsonField(
                                        spotsItem,
                                        r'''$.spot_empty''',
                                      )) {
                                    return WarehouseAddParcelWidget(
                                      key: Key(
                                          'Key4zo_${spotsIndex}_of_${spots.length}'),
                                    );
                                  } else {
                                    return WarehouseLockedSpotWidget(
                                      key: Key(
                                          'Key2cf_${spotsIndex}_of_${spots.length}'),
                                      days: getJsonField(
                                        spotsItem,
                                        r'''$.days_to_unlock''',
                                      ),
                                    );
                                  }
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
