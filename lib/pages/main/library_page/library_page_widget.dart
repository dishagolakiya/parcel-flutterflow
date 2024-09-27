import '/backend/api_requests/api_calls.dart';
import '/components/bottomsheets/bottomsheet_open_parcel/bottomsheet_open_parcel_widget.dart';
import '/components/bottomsheets/library_menu_bottomsheet/library_menu_bottomsheet_widget.dart';
import '/components/misc/folder_image_grid/folder_image_grid_widget.dart';
import '/components/misc/no_data_component/no_data_component_widget.dart';
import '/components/parcels_components/library_parcel/library_parcel_widget.dart';
import '/components/parcels_components/library_parcel_by_creator/library_parcel_by_creator_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'library_page_model.dart';
export 'library_page_model.dart';

class LibraryPageWidget extends StatefulWidget {
  const LibraryPageWidget({super.key});

  @override
  State<LibraryPageWidget> createState() => _LibraryPageWidgetState();
}

class _LibraryPageWidgetState extends State<LibraryPageWidget>
    with TickerProviderStateMixin {
  late LibraryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LibraryPageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    animationsMap.addAll({
      'libraryParcelOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.5,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Library',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 30.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).headlineMediumFamily),
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 64.0,
              icon: Icon(
                Icons.search_sharp,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 26.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: const Alignment(0.0, 0),
                      child: FlutterFlowButtonTabBar(
                        useToggleButtonStyle: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                        unselectedLabelStyle: const TextStyle(),
                        labelColor: FlutterFlowTheme.of(context).primaryText,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        backgroundColor: FlutterFlowTheme.of(context).tertiary,
                        unselectedBackgroundColor:
                            FlutterFlowTheme.of(context).chatReceive,
                        borderWidth: 0.0,
                        borderRadius: 6.0,
                        elevation: 2.0,
                        buttonMargin:
                            const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 3.0, 0.0),
                        padding: const EdgeInsets.all(10.0),
                        tabs: const [
                          Tab(
                            text: 'Recents',
                          ),
                          Tab(
                            text: 'Rating',
                          ),
                          Tab(
                            text: 'Creator',
                          ),
                          Tab(
                            text: 'Folders',
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [
                            () async {},
                            () async {},
                            () async {},
                            () async {}
                          ][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          FutureBuilder<ApiCallResponse>(
                            future: GetSortedLibraryCall.call(
                              authToken: FFAppState().accessToken,
                              sortBy: 'recent',
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
                              final columnGetSortedLibraryResponse =
                                  snapshot.data!;

                              return Builder(
                                builder: (context) {
                                  final daywiseSortedParcels =
                                      columnGetSortedLibraryResponse.jsonBody
                                          .toList();
                                  if (daywiseSortedParcels.isEmpty) {
                                    return const Center(
                                      child: NoDataComponentWidget(
                                        messageText:
                                            'No parcels are added in Library!',
                                      ),
                                    );
                                  }

                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                              daywiseSortedParcels.length,
                                              (daywiseSortedParcelsIndex) {
                                        final daywiseSortedParcelsItem =
                                            daywiseSortedParcels[
                                                daywiseSortedParcelsIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  getJsonField(
                                                    daywiseSortedParcelsItem,
                                                    r'''$.time''',
                                                  )?.toString(),
                                                  'Day',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent2,
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final sortedParcels =
                                                    getJsonField(
                                                  daywiseSortedParcelsItem,
                                                  r'''$.parcels''',
                                                ).toList();

                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                            sortedParcels
                                                                .length,
                                                            (sortedParcelsIndex) {
                                                      final sortedParcelsItem =
                                                          sortedParcels[
                                                              sortedParcelsIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () =>
                                                                    FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      BottomsheetOpenParcelWidget(
                                                                    parcelObj:
                                                                        sortedParcelsItem,
                                                                    contentType:
                                                                        getJsonField(
                                                                      sortedParcelsItem,
                                                                      r'''$.content_type''',
                                                                    ).toString(),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                        onLongPress: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () =>
                                                                    FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      LibraryMenuBottomsheetWidget(
                                                                    parcelId:
                                                                        getJsonField(
                                                                      sortedParcelsItem,
                                                                      r'''$.id''',
                                                                    ),
                                                                    userId:
                                                                        getJsonField(
                                                                      sortedParcelsItem,
                                                                      r'''$.user.user''',
                                                                    ).toString(),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                        child:
                                                            LibraryParcelWidget(
                                                          key: Key(
                                                              'Key1ou_${sortedParcelsIndex}_of_${sortedParcels.length}'),
                                                          imageUrl:
                                                              getJsonField(
                                                            sortedParcelsItem,
                                                            r'''$.parcel_image''',
                                                          ).toString(),
                                                          title: getJsonField(
                                                            sortedParcelsItem,
                                                            r'''$.title''',
                                                          ).toString(),
                                                          starRating:
                                                              getJsonField(
                                                            sortedParcelsItem,
                                                            r'''$.ratings_count''',
                                                          ),
                                                          userCount:
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              sortedParcelsItem,
                                                              r'''$.unique_users_count''',
                                                            )?.toString(),
                                                            '1k',
                                                          ),
                                                          userDpUrl:
                                                              getJsonField(
                                                            sortedParcelsItem,
                                                            r'''$.user.profile_pic''',
                                                          ).toString(),
                                                          username:
                                                              getJsonField(
                                                            sortedParcelsItem,
                                                            r'''$.user.username''',
                                                          ).toString(),
                                                          userId: getJsonField(
                                                            sortedParcelsItem,
                                                            r'''$.user.user''',
                                                          ).toString(),
                                                        ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'libraryParcelOnPageLoadAnimation']!);
                                                    })
                                                        .divide(const SizedBox(
                                                            width: 10.0))
                                                        .addToStart(const SizedBox(
                                                            width: 10.0))
                                                        .addToEnd(const SizedBox(
                                                            width: 10.0)),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      })
                                          .addToStart(const SizedBox(height: 20.0))
                                          .addToEnd(const SizedBox(height: 20.0)),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          FutureBuilder<ApiCallResponse>(
                            future: GetSortedLibraryCall.call(
                              authToken: FFAppState().accessToken,
                              sortBy: 'ratings',
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
                              final columnGetSortedLibraryResponse =
                                  snapshot.data!;

                              return Builder(
                                builder: (context) {
                                  final ratingwiseParcels =
                                      columnGetSortedLibraryResponse.jsonBody
                                          .toList();
                                  if (ratingwiseParcels.isEmpty) {
                                    return const Center(
                                      child: NoDataComponentWidget(
                                        messageText:
                                            'No parcels are added in Library!',
                                      ),
                                    );
                                  }

                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                              ratingwiseParcels.length,
                                              (ratingwiseParcelsIndex) {
                                        final ratingwiseParcelsItem =
                                            ratingwiseParcels[
                                                ratingwiseParcelsIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  RatingBarIndicator(
                                                    itemBuilder:
                                                        (context, index) =>
                                                            Icon(
                                                      Icons.star_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .starRating,
                                                    ),
                                                    direction: Axis.horizontal,
                                                    rating: getJsonField(
                                                      ratingwiseParcelsItem,
                                                      r'''$.rating''',
                                                    ),
                                                    unratedColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent3,
                                                    itemCount: 5,
                                                    itemSize: 30.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final ratingSortedParcels =
                                                    getJsonField(
                                                  ratingwiseParcelsItem,
                                                  r'''$.parcels''',
                                                ).toList();

                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: List.generate(
                                                            ratingSortedParcels
                                                                .length,
                                                            (ratingSortedParcelsIndex) {
                                                      final ratingSortedParcelsItem =
                                                          ratingSortedParcels[
                                                              ratingSortedParcelsIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () =>
                                                                    FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      BottomsheetOpenParcelWidget(
                                                                    parcelObj:
                                                                        ratingSortedParcelsItem,
                                                                    contentType:
                                                                        getJsonField(
                                                                      ratingSortedParcelsItem,
                                                                      r'''$.content_type''',
                                                                    ).toString(),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                        child:
                                                            LibraryParcelWidget(
                                                          key: Key(
                                                              'Key0kc_${ratingSortedParcelsIndex}_of_${ratingSortedParcels.length}'),
                                                          imageUrl:
                                                              getJsonField(
                                                            ratingSortedParcelsItem,
                                                            r'''$.parcel_image''',
                                                          ).toString(),
                                                          title: getJsonField(
                                                            ratingSortedParcelsItem,
                                                            r'''$.title''',
                                                          ).toString(),
                                                          starRating:
                                                              getJsonField(
                                                            ratingSortedParcelsItem,
                                                            r'''$.ratings_count''',
                                                          ),
                                                          userCount:
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              ratingSortedParcelsItem,
                                                              r'''$.unique_users_count''',
                                                            )?.toString(),
                                                            '1k',
                                                          ),
                                                          userDpUrl:
                                                              getJsonField(
                                                            ratingSortedParcelsItem,
                                                            r'''$.user.profile_pic''',
                                                          ).toString(),
                                                          username:
                                                              getJsonField(
                                                            ratingSortedParcelsItem,
                                                            r'''$.user.username''',
                                                          ).toString(),
                                                          userId: getJsonField(
                                                            ratingSortedParcelsItem,
                                                            r'''$.user.user''',
                                                          ).toString(),
                                                        ),
                                                      );
                                                    })
                                                        .divide(const SizedBox(
                                                            width: 10.0))
                                                        .addToStart(const SizedBox(
                                                            width: 10.0))
                                                        .addToEnd(const SizedBox(
                                                            width: 10.0)),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      })
                                          .addToStart(const SizedBox(height: 20.0))
                                          .addToEnd(const SizedBox(height: 20.0)),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          FutureBuilder<ApiCallResponse>(
                            future: GetSortedLibraryCall.call(
                              authToken: FFAppState().accessToken,
                              sortBy: 'creator',
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
                              final columnGetSortedLibraryResponse =
                                  snapshot.data!;

                              return Builder(
                                builder: (context) {
                                  final creatorSorted =
                                      columnGetSortedLibraryResponse.jsonBody
                                          .toList();
                                  if (creatorSorted.isEmpty) {
                                    return const Center(
                                      child: NoDataComponentWidget(
                                        messageText:
                                            'No parcels are added in Library!',
                                      ),
                                    );
                                  }

                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                              creatorSorted.length,
                                              (creatorSortedIndex) {
                                        final creatorSortedItem =
                                            creatorSorted[creatorSortedIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'UserPage',
                                                        queryParameters: {
                                                          'userId':
                                                              serializeParam(
                                                            getJsonField(
                                                              creatorSortedItem,
                                                              r'''$.creator.user''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 30.0,
                                                          height: 30.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            getJsonField(
                                                              creatorSortedItem,
                                                              r'''$.creator.profile_pic''',
                                                            ).toString(),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '${valueOrDefault<String>(
                                                                getJsonField(
                                                                  creatorSortedItem,
                                                                  r'''$.creator.first_name''',
                                                                )?.toString(),
                                                                'Fname',
                                                              )} ${getJsonField(
                                                                creatorSortedItem,
                                                                r'''$.creator.last_name''',
                                                              ).toString()}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            AutoSizeText(
                                                              '@${getJsonField(
                                                                creatorSortedItem,
                                                                r'''$.creator.username''',
                                                              ).toString()}',
                                                              minFontSize: 5.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 8.0)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final creatorSortedParcels =
                                                    getJsonField(
                                                  creatorSortedItem,
                                                  r'''$.parcels''',
                                                ).toList();

                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                            creatorSortedParcels
                                                                .length,
                                                            (creatorSortedParcelsIndex) {
                                                      final creatorSortedParcelsItem =
                                                          creatorSortedParcels[
                                                              creatorSortedParcelsIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () =>
                                                                    FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      BottomsheetOpenParcelWidget(
                                                                    parcelObj:
                                                                        creatorSortedParcelsItem,
                                                                    contentType:
                                                                        getJsonField(
                                                                      creatorSortedParcelsItem,
                                                                      r'''$.content_type''',
                                                                    ).toString(),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                        child:
                                                            LibraryParcelByCreatorWidget(
                                                          key: Key(
                                                              'Key6u5_${creatorSortedParcelsIndex}_of_${creatorSortedParcels.length}'),
                                                          imageUrl:
                                                              getJsonField(
                                                            creatorSortedParcelsItem,
                                                            r'''$.parcel_image''',
                                                          ).toString(),
                                                          title: valueOrDefault<
                                                              String>(
                                                            getJsonField(
                                                              creatorSortedParcelsItem,
                                                              r'''$.title''',
                                                            )?.toString(),
                                                            'Title',
                                                          ),
                                                          starRating:
                                                              getJsonField(
                                                            creatorSortedParcelsItem,
                                                            r'''$.ratings_count''',
                                                          ),
                                                          userCount:
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              creatorSortedParcelsItem,
                                                              r'''$.unique_users_count''',
                                                            )?.toString(),
                                                            '1k',
                                                          ),
                                                        ),
                                                      );
                                                    })
                                                        .divide(const SizedBox(
                                                            width: 10.0))
                                                        .addToStart(const SizedBox(
                                                            width: 10.0))
                                                        .addToEnd(const SizedBox(
                                                            width: 10.0)),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      })
                                          .addToStart(const SizedBox(height: 20.0))
                                          .addToEnd(const SizedBox(height: 20.0)),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 10.0, 12.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'My folders',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.goNamed(
                                          'CreateEditFolderPage',
                                          queryParameters: {
                                            'actionType': serializeParam(
                                              'Create',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: const TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .bottomToTop,
                                            ),
                                          },
                                        );
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
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
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final gridViewGetAllFoldersResponse =
                                          snapshot.data!;

                                      return Builder(
                                        builder: (context) {
                                          final folders =
                                              gridViewGetAllFoldersResponse
                                                  .jsonBody
                                                  .toList();
                                          if (folders.isEmpty) {
                                            return const NoDataComponentWidget(
                                              messageText:
                                                  'You do not have any folders!',
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
                                            itemBuilder:
                                                (context, foldersIndex) {
                                              final foldersItem =
                                                  folders[foldersIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'FolderPage',
                                                    queryParameters: {
                                                      'folderId':
                                                          serializeParam(
                                                        getJsonField(
                                                          foldersItem,
                                                          r'''$.id''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: FolderImageGridWidget(
                                                  key: Key(
                                                      'Keyqe7_${foldersIndex}_of_${folders.length}'),
                                                  folderObj: foldersItem,
                                                ),
                                              );
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
