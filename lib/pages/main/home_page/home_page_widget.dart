import '/backend/api_requests/api_calls.dart';
import '/components/parcels_components/home_parcel/home_parcel_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.profileapiResult = await GetUserProfileCall.call(
        authToken: FFAppState().accessToken,
      );

      if ((_model.profileapiResult?.statusCode ?? 200) == 401) {
        _model.refreshapiResult = await GetAccessTokenCall.call(
          refresh: FFAppState().refreshToken,
        );

        if ((_model.refreshapiResult?.succeeded ?? true)) {
          FFAppState().accessToken = GetAccessTokenCall.access(
            (_model.refreshapiResult?.jsonBody ?? ''),
          )!;
          FFAppState().refreshToken = GetAccessTokenCall.refresh(
            (_model.refreshapiResult?.jsonBody ?? ''),
          )!;
          safeSetState(() {});
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                (_model.refreshapiResult?.jsonBody ?? '').toString(),
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: const Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
        }
      } else {
        return;
      }
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

    return FutureBuilder<ApiCallResponse>(
      future: GetExplorePageParcelsCall.call(
        authToken: FFAppState().accessToken,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        final homePageGetExplorePageParcelsResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60.0),
              child: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                title: Text(
                  'Explore',
                  textAlign: TextAlign.center,
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
                actions: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.search,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      context.pushNamed('SearchPage');
                    },
                  ),
                ],
                centerTitle: true,
                elevation: 0.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final exploreParcels =
                            homePageGetExplorePageParcelsResponse.jsonBody
                                .toList();

                        return ListView.separated(
                          padding: const EdgeInsets.fromLTRB(
                            0,
                            30.0,
                            0,
                            30.0,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: exploreParcels.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 50.0),
                          itemBuilder: (context, exploreParcelsIndex) {
                            final exploreParcelsItem =
                                exploreParcels[exploreParcelsIndex];
                            return HomeParcelWidget(
                              key: Key(
                                  'Keyo3f_${exploreParcelsIndex}_of_${exploreParcels.length}'),
                              imageURL: getJsonField(
                                exploreParcelsItem,
                                r'''$.parcel_image''',
                              ).toString(),
                              title: getJsonField(
                                exploreParcelsItem,
                                r'''$.title''',
                              ).toString(),
                              description: getJsonField(
                                exploreParcelsItem,
                                r'''$.description''',
                              ).toString(),
                              starRating: getJsonField(
                                exploreParcelsItem,
                                r'''$.ratings_count''',
                              ),
                              userCount: getJsonField(
                                exploreParcelsItem,
                                r'''$.unique_users_count''',
                              ).toString(),
                              daysToUnlock: getJsonField(
                                exploreParcelsItem,
                                r'''$.days_to_unlock''',
                              ),
                              id: getJsonField(
                                exploreParcelsItem,
                                r'''$.id''',
                              ),
                              username: valueOrDefault<String>(
                                getJsonField(
                                  exploreParcelsItem,
                                  r'''$.user.username''',
                                )?.toString(),
                                'username',
                              ),
                              userDpUrl: getJsonField(
                                exploreParcelsItem,
                                r'''$.user.profile_pic''',
                              ).toString(),
                              userId: getJsonField(
                                exploreParcelsItem,
                                r'''$.user.user''',
                              ).toString(),
                            );
                          },
                        );
                      },
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
