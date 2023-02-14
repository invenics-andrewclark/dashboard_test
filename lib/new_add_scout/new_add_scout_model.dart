import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewAddScoutModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isMediaUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isMediaUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for Scout_FullName widget.
  TextEditingController? scoutFullNameController;
  String? Function(BuildContext, String?)? scoutFullNameControllerValidator;
  // State field(s) for Scout_Phn widget.
  TextEditingController? scoutPhnController;
  String? Function(BuildContext, String?)? scoutPhnControllerValidator;
  // State field(s) for Scout_Email widget.
  TextEditingController? scoutEmailController;
  String? Function(BuildContext, String?)? scoutEmailControllerValidator;
  DateTime? datePicked;
  // State field(s) for Scout_Gender widget.
  String? scoutGenderValue;
  // State field(s) for Scout_Pin widget.
  TextEditingController? scoutPinController;
  String? Function(BuildContext, String?)? scoutPinControllerValidator;
  // Stores action output result for [Backend Call - API (Location API)] action in Scout_Pin widget.
  ApiCallResponse? address;
  // State field(s) for Recrutment widget.
  TextEditingController? recrutmentController;
  String? Function(BuildContext, String?)? recrutmentControllerValidator;
  // State field(s) for Refferal widget.
  TextEditingController? refferalController;
  String? Function(BuildContext, String?)? refferalControllerValidator;
  // State field(s) for Scout_Adhaar_number widget.
  TextEditingController? scoutAdhaarNumberController;
  String? Function(BuildContext, String?)? scoutAdhaarNumberControllerValidator;
  // State field(s) for Scout_PAN widget.
  TextEditingController? scoutPANController;
  String? Function(BuildContext, String?)? scoutPANControllerValidator;
  // State field(s) for Scout_Account_No widget.
  TextEditingController? scoutAccountNoController;
  String? Function(BuildContext, String?)? scoutAccountNoControllerValidator;
  // State field(s) for Scout_Bank_IFSC widget.
  TextEditingController? scoutBankIFSCController;
  String? Function(BuildContext, String?)? scoutBankIFSCControllerValidator;
  // State field(s) for Scout_Account_Name widget.
  TextEditingController? scoutAccountNameController;
  String? Function(BuildContext, String?)? scoutAccountNameControllerValidator;
  // State field(s) for Scout_Bank_Name widget.
  TextEditingController? scoutBankNameController;
  String? Function(BuildContext, String?)? scoutBankNameControllerValidator;
  // Stores action output result for [Custom Action - panExist] action in Button widget.
  bool? pan;
  // Stores action output result for [Custom Action - aadharExist] action in Button widget.
  bool? aadhar;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    scoutFullNameController?.dispose();
    scoutPhnController?.dispose();
    scoutEmailController?.dispose();
    scoutPinController?.dispose();
    recrutmentController?.dispose();
    refferalController?.dispose();
    scoutAdhaarNumberController?.dispose();
    scoutPANController?.dispose();
    scoutAccountNoController?.dispose();
    scoutBankIFSCController?.dispose();
    scoutAccountNameController?.dispose();
    scoutBankNameController?.dispose();
  }

  /// Additional helper methods are added here.

}
