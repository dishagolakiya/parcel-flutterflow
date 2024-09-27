import '/components/dialog/warehouse_dialog/warehouse_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'warehouse_locked_spot_model.dart';
export 'warehouse_locked_spot_model.dart';

class WarehouseLockedSpotWidget extends StatefulWidget {
  const WarehouseLockedSpotWidget({
    super.key,
    this.days,
  });

  final int? days;

  @override
  State<WarehouseLockedSpotWidget> createState() =>
      _WarehouseLockedSpotWidgetState();
}

class _WarehouseLockedSpotWidgetState extends State<WarehouseLockedSpotWidget> {
  late WarehouseLockedSpotModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WarehouseLockedSpotModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(15.0),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            await showDialog(
              context: context,
              builder: (dialogContext) {
                return Dialog(
                  elevation: 0,
                  insetPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  alignment: const AlignmentDirectional(0.0, 0.0)
                      .resolve(Directionality.of(context)),
                  child: WarehouseDialogWidget(
                    days: widget.days,
                  ),
                );
              },
            );
          },
          child: Material(
            color: Colors.transparent,
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).accent3,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Icon(
                Icons.lock_clock_rounded,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                size: 70.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
