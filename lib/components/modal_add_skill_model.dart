import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalAddSkillModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for selectSkill widget.
  String? selectSkillValue;
  // State field(s) for selectSkillLevel widget.
  String? selectSkillLevelValue;
  // State field(s) for yearsExperience widget.
  TextEditingController? yearsExperienceController;
  String? Function(BuildContext, String?)? yearsExperienceControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    yearsExperienceController?.dispose();
  }

  /// Additional helper methods are added here.

}
