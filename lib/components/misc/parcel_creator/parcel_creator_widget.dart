import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'parcel_creator_model.dart';
export 'parcel_creator_model.dart';

class ParcelCreatorWidget extends StatefulWidget {
  const ParcelCreatorWidget({
    super.key,
    this.imageUrl,
    this.username,
    this.id,
    int? imageDiameter,
    this.userObj,
    this.rowPadding,
  }) : imageDiameter = imageDiameter ?? 18;

  final String? imageUrl;
  final String? username;
  final String? id;
  final int imageDiameter;
  final dynamic userObj;
  final int? rowPadding;

  @override
  State<ParcelCreatorWidget> createState() => _ParcelCreatorWidgetState();
}

class _ParcelCreatorWidgetState extends State<ParcelCreatorWidget> {
  late ParcelCreatorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ParcelCreatorModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(valueOrDefault<double>(
        widget.rowPadding?.toDouble(),
        15.0,
      )),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed(
            'UserPage',
            queryParameters: {
              'userId': serializeParam(
                widget.id,
                ParamType.String,
              ),
            }.withoutNulls,
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: widget.imageDiameter.toDouble(),
              height: widget.imageDiameter.toDouble(),
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                getJsonField(
                  widget.userObj,
                  r'''$.profile_pic''',
                ).toString(),
                fit: BoxFit.cover,
              ),
            ),
            Text(
              valueOrDefault<String>(
                '@${getJsonField(
                  widget.userObj,
                  r'''$.username''',
                ).toString()}',
                '@username',
              ).maybeHandleOverflow(
                maxChars: 10,
                replacement: '…',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: FlutterFlowTheme.of(context).textOverImage,
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
            ),
          ].divide(const SizedBox(width: 5.0)),
        ),
      ),
    );
  }
}
