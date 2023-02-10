import '../backend/backend.dart';
import '../components/used_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrganisationnDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for used component.
  late UsedModel usedModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    usedModel = createModel(context, () => UsedModel());
  }

  void dispose() {}

  /// Additional helper methods are added here.

}
