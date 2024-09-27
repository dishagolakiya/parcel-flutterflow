import '/components/misc/parcel_creator/parcel_creator_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'warehouse_parcel_model.dart';
export 'warehouse_parcel_model.dart';

class WarehouseParcelWidget extends StatefulWidget {
  const WarehouseParcelWidget({
    super.key,
    this.imageUrl,
    this.daysClicked,
    this.daysToUnlock,
    this.title,
    this.countProgress,
    this.isActive,
    this.userDpUrl,
    this.username,
    this.userId,
  });

  final String? imageUrl;
  final int? daysClicked;
  final int? daysToUnlock;
  final String? title;
  final double? countProgress;
  final bool? isActive;
  final String? userDpUrl;
  final String? username;
  final String? userId;

  @override
  State<WarehouseParcelWidget> createState() => _WarehouseParcelWidgetState();
}

class _WarehouseParcelWidgetState extends State<WarehouseParcelWidget> {
  late WarehouseParcelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WarehouseParcelModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: !widget.isActive!
                ? FlutterFlowTheme.of(context).success
                : const Color(0x00000000),
            width: 5.0,
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  widget.imageUrl!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: wrapWithModel(
                      model: _model.parcelCreatorModel,
                      updateCallback: () => safeSetState(() {}),
                      child: ParcelCreatorWidget(
                        imageUrl: widget.userDpUrl,
                        username: widget.username,
                        id: widget.userId,
                        imageDiameter: 22,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.17),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0x000B0B0B), Color(0xDC262626)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: Text(
                                    '${widget.daysClicked?.toString()}/${widget.daysToUnlock?.toString()} ${widget.daysToUnlock == 1 ? 'day' : 'days'}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .textOverImage,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    LinearPercentIndicator(
                                      percent: widget.countProgress!,
                                      width: 80.0,
                                      lineHeight: 8.0,
                                      animation: true,
                                      animateFromLastPercent: true,
                                      progressColor: const Color(0xCD26DD5A),
                                      backgroundColor: const Color(0xCCFFFFFF),
                                      barRadius: const Radius.circular(4.0),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            AutoSizeText(
                              valueOrDefault<String>(
                                widget.title,
                                'Title',
                              ),
                              maxLines: 1,
                              minFontSize: 12.0,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .textOverImage,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ].divide(const SizedBox(height: 4.0)),
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
    );
  }
}
