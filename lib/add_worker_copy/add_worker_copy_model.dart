import '../backend/api_requests/api_calls.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/modal_add_skill_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddWorkerCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for workerName widget.
  TextEditingController? workerNameController;
  String? Function(BuildContext, String?)? workerNameControllerValidator;
  // State field(s) for workerEmail widget.
  TextEditingController? workerEmailController;
  String? Function(BuildContext, String?)? workerEmailControllerValidator;
  // State field(s) for titleRole widget.
  TextEditingController? titleRoleController;
  String? Function(BuildContext, String?)? titleRoleControllerValidator;
  // State field(s) for workerGender widget.
  String? workerGenderValue;
  // State field(s) for workerPinCode widget.
  TextEditingController? workerPinCodeController;
  String? Function(BuildContext, String?)? workerPinCodeControllerValidator;
  // Stores action output result for [Backend Call - API (locationAPI)] action in workerPinCode widget.
  ApiCallResponse? apiLocationResult;
  // State field(s) for workerAadhar widget.
  TextEditingController? workerAadharController;
  String? Function(BuildContext, String?)? workerAadharControllerValidator;
  // State field(s) for workerPanNumber widget.
  TextEditingController? workerPanNumberController;
  String? Function(BuildContext, String?)? workerPanNumberControllerValidator;
  // State field(s) for workerIFSCCode widget.
  TextEditingController? workerIFSCCodeController;
  String? Function(BuildContext, String?)? workerIFSCCodeControllerValidator;
  // State field(s) for workerAcountNumber widget.
  TextEditingController? workerAcountNumberController;
  String? Function(BuildContext, String?)?
      workerAcountNumberControllerValidator;
  // State field(s) for workerAccountNumber widget.
  TextEditingController? workerAccountNumberController;
  String? Function(BuildContext, String?)?
      workerAccountNumberControllerValidator;
  // State field(s) for workerBankName widget.
  TextEditingController? workerBankNameController;
  String? Function(BuildContext, String?)? workerBankNameControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    workerNameController?.dispose();
    workerEmailController?.dispose();
    titleRoleController?.dispose();
    workerPinCodeController?.dispose();
    workerAadharController?.dispose();
    workerPanNumberController?.dispose();
    workerIFSCCodeController?.dispose();
    workerAcountNumberController?.dispose();
    workerAccountNumberController?.dispose();
    workerBankNameController?.dispose();
  }

  /// Additional helper methods are added here.

}
