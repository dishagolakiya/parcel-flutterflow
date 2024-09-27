import '/components/bottomsheets/bottomsheet_ship_parcel_home/bottomsheet_ship_parcel_home_widget.dart';
import '/components/misc/parcel_creator/parcel_creator_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_parcel_model.dart';
export 'home_parcel_model.dart';

class HomeParcelWidget extends StatefulWidget {
  const HomeParcelWidget({
    super.key,
    this.imageURL,
    this.title,
    this.description,
    this.starRating,
    this.userCount,
    this.daysToUnlock,
    this.id,
    this.username,
    this.userDpUrl,
    this.userId,
  });

  final String? imageURL;
  final String? title;
  final String? description;
  final double? starRating;
  final String? userCount;
  final int? daysToUnlock;
  final int? id;
  final String? username;
  final String? userDpUrl;
  final String? userId;

  @override
  State<HomeParcelWidget> createState() => _HomeParcelWidgetState();
}

class _HomeParcelWidgetState extends State<HomeParcelWidget> {
  late HomeParcelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeParcelModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            maxHeight: 800.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                    child: Image.network(
                      widget.imageURL!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.parcelCreatorModel,
                    updateCallback: () => safeSetState(() {}),
                    child: ParcelCreatorWidget(
                      imageUrl: widget.userDpUrl,
                      username: widget.username,
                      id: widget.userId,
                      imageDiameter: 24,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.title,
                          'Title',
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.description,
                        'Description',
                      ),
                      maxLines: 3,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            fontStyle: FontStyle.italic,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                RatingBarIndicator(
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star_rounded,
                                    color:
                                        FlutterFlowTheme.of(context).starRating,
                                  ),
                                  direction: Axis.horizontal,
                                  rating: widget.starRating!,
                                  unratedColor:
                                      FlutterFlowTheme.of(context).accent3,
                                  itemCount: 5,
                                  itemSize: 18.0,
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    widget.userCount,
                                    '1.2k',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ].divide(const SizedBox(width: 4.0)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Days to unlock',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    '${valueOrDefault<String>(
                                      widget.daysToUnlock?.toString(),
                                      '1',
                                    )} ${widget.daysToUnlock == 1 ? ' day' : 'days'}',
                                    '2 days',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ],
                            ),
                          ].divide(const SizedBox(height: 4.0)),
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 40.0,
                          borderWidth: 1.0,
                          buttonSize: 50.0,
                          icon: Icon(
                            Icons.local_shipping,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 32.0,
                          ),
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              useSafeArea: true,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: BottomsheetShipParcelHomeWidget(
                                    parcelID: widget.id,
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                        ),
                      ],
                    ),
                  ].divide(const SizedBox(height: 5.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
