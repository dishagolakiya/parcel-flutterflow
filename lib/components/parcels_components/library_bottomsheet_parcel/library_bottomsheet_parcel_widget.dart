import '/components/misc/parcel_creator/parcel_creator_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'library_bottomsheet_parcel_model.dart';
export 'library_bottomsheet_parcel_model.dart';

class LibraryBottomsheetParcelWidget extends StatefulWidget {
  const LibraryBottomsheetParcelWidget({
    super.key,
    required this.parcelImage,
    required this.title,
    required this.description,
    this.starRating,
    this.userCount,
    this.userDpUrl,
    this.username,
    this.userId,
  });

  final String? parcelImage;
  final String? title;
  final String? description;
  final double? starRating;
  final String? userCount;
  final String? userDpUrl;
  final String? username;
  final String? userId;

  @override
  State<LibraryBottomsheetParcelWidget> createState() =>
      _LibraryBottomsheetParcelWidgetState();
}

class _LibraryBottomsheetParcelWidgetState
    extends State<LibraryBottomsheetParcelWidget> {
  late LibraryBottomsheetParcelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LibraryBottomsheetParcelModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(25.0),
            shape: BoxShape.rectangle,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                      widget.parcelImage!,
                      width: double.infinity,
                      height: 300.0,
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
                      imageDiameter: 22,
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            RatingBarIndicator(
                              itemBuilder: (context, index) => Icon(
                                Icons.star_rounded,
                                color: FlutterFlowTheme.of(context).starRating,
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
                                '1k',
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
