import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class JobdetailsAcceptModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for job widget.
  TextEditingController? jobController1;
  String? Function(BuildContext, String?)? jobController1Validator;
  // State field(s) for job widget.
  TextEditingController? jobController2;
  String? Function(BuildContext, String?)? jobController2Validator;
  // State field(s) for Year widget.
  TextEditingController? yearController;
  String? Function(BuildContext, String?)? yearControllerValidator;
  // State field(s) for Month widget.
  TextEditingController? monthController;
  String? Function(BuildContext, String?)? monthControllerValidator;
  // State field(s) for Skills widget.
  String? skillsValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    jobController1?.dispose();
    jobController2?.dispose();
    yearController?.dispose();
    monthController?.dispose();
  }

  /// Additional helper methods are added here.

}
