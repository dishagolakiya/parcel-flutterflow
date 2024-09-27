import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'handle_bottomsheet_model.dart';
export 'handle_bottomsheet_model.dart';

class HandleBottomsheetWidget extends StatefulWidget {
  const HandleBottomsheetWidget({super.key});

  @override
  State<HandleBottomsheetWidget> createState() =>
      _HandleBottomsheetWidgetState();
}

class _HandleBottomsheetWidgetState extends State<HandleBottomsheetWidget> {
  late HandleBottomsheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HandleBottomsheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 30.0,
        height: 3.0,
        decoration: BoxDecoration(
          color: const Color(0xFFCCCCCC),
          borderRadius: BorderRadius.circular(2.0),
        ),
      ),
    );
  }
}
