import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SkillsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Skills widget.
  String? skillsValue;
  // State field(s) for Year widget.
  TextEditingController? yearController;
  String? Function(BuildContext, String?)? yearControllerValidator;
  // State field(s) for Month widget.
  TextEditingController? monthController;
  String? Function(BuildContext, String?)? monthControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    yearController?.dispose();
    monthController?.dispose();
  }

  /// Additional helper methods are added here.

}
