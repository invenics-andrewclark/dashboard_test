import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dgroup_model.dart';
export 'dgroup_model.dart';

class DgroupWidget extends StatefulWidget {
  const DgroupWidget({Key? key}) : super(key: key);

  @override
  _DgroupWidgetState createState() => _DgroupWidgetState();
}

class _DgroupWidgetState extends State<DgroupWidget> {
  late DgroupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DgroupModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlutterFlowDropDown<String>(
      options: ['Option 1'],
      onChanged: (val) => setState(() => _model.dropDownValue = val),
      width: 180,
      height: 50,
      textStyle: FlutterFlowTheme.of(context).bodyText1.override(
            fontFamily: 'Poppins',
            color: Colors.black,
          ),
      hintText: 'Please select...',
      fillColor: Colors.white,
      elevation: 2,
      borderColor: Colors.transparent,
      borderWidth: 0,
      borderRadius: 0,
      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
      hidesUnderline: true,
    );
  }
}
