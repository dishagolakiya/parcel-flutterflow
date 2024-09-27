import '/components/misc/chat_room_tile/chat_room_tile_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'activity_page_model.dart';
export 'activity_page_model.dart';

class ActivityPageWidget extends StatefulWidget {
  const ActivityPageWidget({super.key});

  @override
  State<ActivityPageWidget> createState() => _ActivityPageWidgetState();
}

class _ActivityPageWidgetState extends State<ActivityPageWidget>
    with TickerProviderStateMixin {
  late ActivityPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivityPageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 3,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Activity',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
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
                Icons.chevron_right,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 34.0,
              ),
              onPressed: () async {
                context.pushNamed(
                  'ProfilePage',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: const TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.rightToLeft,
                    ),
                  },
                );
              },
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: const Alignment(0.0, 0),
                    child: FlutterFlowButtonTabBar(
                      useToggleButtonStyle: true,
                      labelStyle: FlutterFlowTheme.of(context)
                          .titleMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleMediumFamily,
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w300,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleMediumFamily),
                          ),
                      unselectedLabelStyle: const TextStyle(),
                      labelColor: FlutterFlowTheme.of(context).primaryText,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      backgroundColor: FlutterFlowTheme.of(context).tertiary,
                      unselectedBackgroundColor:
                          FlutterFlowTheme.of(context).tabColour,
                      borderWidth: 0.0,
                      borderRadius: 6.0,
                      elevation: 2.0,
                      buttonMargin:
                          const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 3.0, 0.0),
                      padding: const EdgeInsets.all(8.0),
                      tabs: const [
                        Tab(
                          text: 'Followers',
                        ),
                        Tab(
                          text: 'Shipping',
                        ),
                        Tab(
                          text: 'Rating',
                        ),
                        Tab(
                          text: 'Messages',
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
                        Text(
                          'Followers notifications coming soon',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 26.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                        Text(
                          'Shipping notifications coming soon',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 26.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                        Text(
                          'Rating notifications coming soon',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 26.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                        ListView(
                          padding: const EdgeInsets.fromLTRB(
                            0,
                            0,
                            0,
                            10.0,
                          ),
                          scrollDirection: Axis.vertical,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'ChatRoomPage',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                    ),
                                  },
                                );
                              },
                              child: wrapWithModel(
                                model: _model.chatRoomTileModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: const ChatRoomTileWidget(),
                              ),
                            ),
                            wrapWithModel(
                              model: _model.chatRoomTileModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: const ChatRoomTileWidget(),
                            ),
                            wrapWithModel(
                              model: _model.chatRoomTileModel3,
                              updateCallback: () => safeSetState(() {}),
                              child: const ChatRoomTileWidget(),
                            ),
                            wrapWithModel(
                              model: _model.chatRoomTileModel4,
                              updateCallback: () => safeSetState(() {}),
                              child: const ChatRoomTileWidget(),
                            ),
                            wrapWithModel(
                              model: _model.chatRoomTileModel5,
                              updateCallback: () => safeSetState(() {}),
                              child: const ChatRoomTileWidget(),
                            ),
                            wrapWithModel(
                              model: _model.chatRoomTileModel6,
                              updateCallback: () => safeSetState(() {}),
                              child: const ChatRoomTileWidget(),
                            ),
                            wrapWithModel(
                              model: _model.chatRoomTileModel7,
                              updateCallback: () => safeSetState(() {}),
                              child: const ChatRoomTileWidget(),
                            ),
                            wrapWithModel(
                              model: _model.chatRoomTileModel8,
                              updateCallback: () => safeSetState(() {}),
                              child: const ChatRoomTileWidget(),
                            ),
                            wrapWithModel(
                              model: _model.chatRoomTileModel9,
                              updateCallback: () => safeSetState(() {}),
                              child: const ChatRoomTileWidget(),
                            ),
                            wrapWithModel(
                              model: _model.chatRoomTileModel10,
                              updateCallback: () => safeSetState(() {}),
                              child: const ChatRoomTileWidget(),
                            ),
                          ].divide(const SizedBox(height: 5.0)),
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
    );
  }
}
