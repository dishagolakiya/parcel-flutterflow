import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'warehouse_add_parcel_model.dart';
export 'warehouse_add_parcel_model.dart';

class WarehouseAddParcelWidget extends StatefulWidget {
  const WarehouseAddParcelWidget({super.key});

  @override
  State<WarehouseAddParcelWidget> createState() =>
      _WarehouseAddParcelWidgetState();
}

class _WarehouseAddParcelWidgetState extends State<WarehouseAddParcelWidget> {
  late WarehouseAddParcelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WarehouseAddParcelModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.goNamed('SearchPage');
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
              Icons.add,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 90.0,
            ),
          ),
        ),
      ),
    );
  }
}
