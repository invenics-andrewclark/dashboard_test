import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditAddSkillsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Skills widget.
  String? skillsValue;
  // State field(s) for YearSkill widget.
  TextEditingController? yearSkillController;
  String? Function(BuildContext, String?)? yearSkillControllerValidator;
  // State field(s) for MonthSkill widget.
  TextEditingController? monthSkillController;
  String? Function(BuildContext, String?)? monthSkillControllerValidator;
  // State field(s) for TextFieldjobTitle widget.
  TextEditingController? textFieldjobTitleController;
  String? Function(BuildContext, String?)? textFieldjobTitleControllerValidator;
  // State field(s) for companyNmae widget.
  TextEditingController? companyNmaeController;
  String? Function(BuildContext, String?)? companyNmaeControllerValidator;
  // State field(s) for fromYear widget.
  TextEditingController? fromYearController;
  String? Function(BuildContext, String?)? fromYearControllerValidator;
  // State field(s) for fromMonth widget.
  TextEditingController? fromMonthController;
  String? Function(BuildContext, String?)? fromMonthControllerValidator;
  // State field(s) for toYear widget.
  TextEditingController? toYearController;
  String? Function(BuildContext, String?)? toYearControllerValidator;
  // State field(s) for toMonth widget.
  TextEditingController? toMonthController;
  String? Function(BuildContext, String?)? toMonthControllerValidator;
  // State field(s) for experiencedSkillls widget.
  String? experiencedSkilllsValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    yearSkillController?.dispose();
    monthSkillController?.dispose();
    textFieldjobTitleController?.dispose();
    companyNmaeController?.dispose();
    fromYearController?.dispose();
    fromMonthController?.dispose();
    toYearController?.dispose();
    toMonthController?.dispose();
  }

  /// Additional helper methods are added here.

}
